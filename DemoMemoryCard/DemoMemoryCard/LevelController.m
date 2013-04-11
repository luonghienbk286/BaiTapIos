//
//  LevelController.m
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "LevelController.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#define numOfLevel 4
@interface LevelController ()
{
    AppDelegate *delegate;
    UIImageView *imageView[numOfLevel];
}
@end

@implementation LevelController

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
    delegate= [UIApplication sharedApplication].delegate;

    for(int i=0;i< [delegate->arrayImgLevel count];i++){
        imageView[i] =[[UIImageView alloc] initWithImage:[delegate->arrayImgLevel objectAtIndex:i]];
        CGSize size=[[delegate->arrayPosImgLevel objectAtIndex:i] CGSizeValue];
        imageView[i].frame=CGRectMake(size.width, size.height, delegate.width,delegate.height );
        [self.view addSubview:imageView[i]];
    }
    //////
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip1:)];
        imageView[0].userInteractionEnabled = YES;
        [imageView[0] addGestureRecognizer:tap1];
    ////////
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip2:)];
    imageView[1].userInteractionEnabled = YES;
    [imageView[1] addGestureRecognizer:tap2];
    ////////
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip3:)];
    imageView[2].userInteractionEnabled = YES;
    [imageView[2] addGestureRecognizer:tap3];
    ////////
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip4:)];
    imageView[3].userInteractionEnabled = YES;
    [imageView[3] addGestureRecognizer:tap4];
}
-(void) flip1:(UITapGestureRecognizer *) gesture
{   delegate->level=1;
        NSLog(@"Chạn dc vao roi");
    [self dismissViewControllerAnimated: YES completion:^{
        NSLog(@"Dismiss complete");
    }];
}
-(void) flip2:(UITapGestureRecognizer *) gesture
{   delegate->level=2;
    NSLog(@"Chạn dc vao roi");
    [self dismissViewControllerAnimated: YES completion:^{
        NSLog(@"Dismiss complete");
    }];
}
-(void) flip3:(UITapGestureRecognizer *) gesture
{   delegate->level=3;
    NSLog(@"Chạn dc vao roi");
    [self dismissViewControllerAnimated: YES completion:^{
        NSLog(@"Dismiss complete");
    }];
}
-(void) flip4:(UITapGestureRecognizer *) gesture
{   delegate->level=4;
    NSLog(@"Chạn dc vao roi");
    [self dismissViewControllerAnimated: YES completion:^{
        NSLog(@"Dismiss complete");
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
   }

@end
