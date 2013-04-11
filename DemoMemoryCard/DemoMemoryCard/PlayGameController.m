//
//  PlayGameController.m
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "PlayGameController.h"
#import "AppDelegate.h"
#import "Grid.h"
#import "LevelController.h"

@interface PlayGameController ()
{
    AppDelegate *delegate;
    Grid *grid[20];
    int secondLeft;
       UILabel *label;
    int time;
}

//@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PlayGameController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
        [super viewDidLoad];
    [super didReceiveMemoryWarning];
    delegate= [UIApplication sharedApplication].delegate;
    [self playGame];
   }
- (void)didReceiveMemoryWarning
{
    
}
-(void ) playGame{
    delegate->imageView1=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nen3.jpg"]];
    delegate->imageView2=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nen4.jpg"]];
    [self.view addSubview:delegate->imageView1];
    // self.labelCountDown.text=@"cdfsdf";
    NSLog(@"%d",delegate->level);
    switch (delegate->level) {
        case 1:
            delegate->gameManager=[[GameManager alloc] initWithLevel:delegate->level1];
            NSLog(@"number:%d",delegate->gameManager.gameLevel.numberOfGrid);
            break;
        case 2:
            delegate->gameManager=[[GameManager alloc] initWithLevel:delegate->level2];
            break;
        case 3:
            delegate->gameManager=[[GameManager alloc] initWithLevel:delegate->level3];
            break;
        case 4:
            delegate->gameManager=[[GameManager alloc] initWithLevel:delegate->level4];
            break;
    }
    
    NSLog(@"%d",delegate->level);
    int num =delegate->gameManager.gameLevel.numberOfGrid;
    for(int i=0;i<num;i++){
        //k=i;
        
        grid[i] =[delegate->gameManager.gameLevel.arrayGrid objectAtIndex:i];
        grid[i]->isFlip=NO;
        grid[i]->isCompleted=YES;
        [grid[i] tranformImage:self];
        
    }
   
    label= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    [self.view addSubview:label];
    
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithRed:188 green:255 blue:88 alpha:1.0];
  delegate.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountdown) userInfo:self repeats: YES];
    secondLeft=delegate->gameManager.gameLevel.timePlay;
   
}
-(void) updateCountdown {
    int hours, minutes, seconds;
    if(secondLeft>0)
    {
    secondLeft--;
    NSLog(@"%d",secondLeft);
    hours = secondLeft / 3600;
    minutes = (secondLeft % 3600) / 60;
    seconds = (secondLeft %3600) % 60;
    //label.text =[[NSNumber numberWithUnsignedInt: secondLeft] stringValue];
    label.text=[NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    if(secondLeft==0){
        label.text=@"Time Out";
       //[delegate.timer invalidate];
        delegate->numberOfCard=0;
                for(int j=0;j<delegate->gameManager.gameLevel.numberOfGrid;j++ ){
            NSLog(@"numOF:%d",delegate->gameManager.gameLevel.numberOfGrid);
            [grid[j] deleteImage];
        }
       // [UIView transitionWithView:self.view duration:1 options:UIViewAnimationOptionTransitionCurlDown  animations:^{
          //  [delegate->imageView1 removeFromSuperview];
         //   [self.view addSubview:delegate->imageView2];
        //} completion:^(BOOL finished){
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"Are you sure replay game?"
                                      message:@"Message"
                                      delegate:self
                                      cancelButtonTitle:@"No"
                                      otherButtonTitles:@"Yes", nil];
            [alertView show];
        //}];
    }
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *title=[alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Yes"]){
        [delegate.timer invalidate];
        [self viewDidUnload];
        
        [self viewDidLoad];
    
    }else{
       [delegate.timer invalidate];
        [self dismissViewControllerAnimated: YES completion:^{
            NSLog(@"Dismiss complete");
       
        }];

    
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end
