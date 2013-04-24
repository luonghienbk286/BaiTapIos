//
//  ViewController.m
//  AnimationMusic
//
//  Created by MAC on 4/24/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"
#define NUM_PHOTO 38
@interface ViewController ()
{
    UIImageView *arrayView[38];
    UIView *_transparentView;
    BOOL _isFrontFace;
    int mark;
    UISwipeGestureRecognizer *tapA;
    UISwipeGestureRecognizer *tapB;
    NSArray *timeAnimation;
    NSArray *timeDelayAnimation;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"nhac" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error];
    if (error) {
        NSLog(@"Error %@", error.description);
        return;
    }
    [self.audioPlayer play];
    timeDelayAnimation=[[NSArray alloc] initWithObjects:@"7",@"9",@"9",@"9",@"4",@"5",@"4",@"4",@"5",@"6",@"5",@"5",@"5",@"5",@"4",@"4",@"5",@"4.5",@"6.5",@"5",@"7", @"7",@"4",@"5",@"5",@"4",@"5",@"6",@"5",@"5",@"5",@"5",@"4",@"4",@"5",@"4.5",@"6.5",nil];
    _transparentView = [[UIView alloc] initWithFrame: self.view.bounds];
    for (int i=0; i<NUM_PHOTO; i++) {
        UIImage *image =[UIImage imageNamed:[NSString stringWithFormat:@"c%d.jpg",i]];
        arrayView[i]=[[UIImageView alloc] initWithImage:image];
        //arrayView[i].frame =CGRectMake(0, 0, _transparentView.bounds.size.width, _transparentView.bounds.size.height);
        arrayView[i].contentMode=UIViewContentModeScaleAspectFit;
        arrayView[i].userInteractionEnabled=YES;
        
        tapA= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(flipRightToLeft:)];
        [tapA setDirection:UISwipeGestureRecognizerDirectionLeft];
        [arrayView[i] addGestureRecognizer:tapA];
        
        tapB= [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(flipLeftToRight:)];
        [tapB setDirection:UISwipeGestureRecognizerDirectionRight];
        [arrayView[i] addGestureRecognizer:tapB];
        
    }
    mark=0;
    [self.view addSubview:_transparentView];
    
    [UIView transitionWithView:_transparentView duration:8 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        // NSLog(@"%d",mark+1);
        [_transparentView addSubview:arrayView[0]];
        
    } completion:^(BOOL finished){
        [self flipRightToLeft:tapA];
    }];
    
}

-(void) flipRightToLeft: (UISwipeGestureRecognizer *) gesture
{int a= arc4random_uniform(3)%3;
    NSLog(@"a=%d",a);
    if(mark==NUM_PHOTO-1) return;
    NSLog(@"mark=%d",mark);
    int time =[[timeDelayAnimation objectAtIndex:mark] intValue];
    NSLog(@"time:%d",time);
    if(a==0){
    [UIView transitionWithView:_transparentView duration:time options:UIViewAnimationOptionTransitionCurlDown animations:^{
        // NSLog(@"%d",mark+1);
        [arrayView[mark] removeFromSuperview];
        [_transparentView addSubview:arrayView[mark+1]];
        
    } completion:^(BOOL finished){
            mark=mark+1;
            [self flipRightToLeft:tapA];
    }];
    }else if(a==1){
        [UIView transitionWithView:_transparentView duration:time options:UIViewAnimationOptionTransitionCurlUp animations:^{
            [arrayView[mark] removeFromSuperview];
            [_transparentView addSubview:arrayView[mark+1]];
            
        } completion:^(BOOL finished){
            mark=mark+1;
            [self flipRightToLeft:tapA];
        }];
    }else if(a==2)
    {
        [UIView transitionWithView:_transparentView duration:time options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            [arrayView[mark] removeFromSuperview];
            [_transparentView addSubview:arrayView[mark+1]];
            
        } completion:^(BOOL finished){
            mark=mark+1;
            [self flipRightToLeft:tapA];
        }];
    }
    }
-(void) flipLeftToRight: (UISwipeGestureRecognizer *) gesture{
    if(mark==0) return;
    [UIView transitionWithView:_transparentView duration:1 options:UIViewAnimationOptionTransitionCurlDown animations:^{
        NSLog(@"%d",mark-1);
        [arrayView[mark] removeFromSuperview];
        [_transparentView addSubview:arrayView[mark-1]];
        
        
    } completion:^(BOOL finished){
        mark=mark-1;
        [self flipLeftToRight:tapB];
    }];
}

@end
