//
//  MainController.m
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "MainController.h"
#import "PlayGameController.h"
#import "LevelController.h"
@interface MainController ()

@end

@implementation MainController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)playGame:(id)sender {
    PlayGameController *playController  = [[PlayGameController alloc] initWithNibName:@"LevelController" bundle:nil];
    playController.modalTransitionStyle =UIModalTransitionStyleFlipHorizontal;
    //UIModalTransitionStylePartialCurl;
    [self presentViewController:playController animated:YES completion:^{
        NSLog(@"Presented View Controller is %@", self.presentedViewController);
    }];
}
- (IBAction)selectedLevel:(id)sender {
    LevelController *levelController  = [[LevelController alloc] initWithNibName:@"LevelController" bundle:nil];
    levelController.modalTransitionStyle =UIModalTransitionStylePartialCurl;
    [self presentViewController:levelController animated:YES completion:^{
        NSLog(@"Presented View Controller is %@", self.presentedViewController);
    }];
}
- (IBAction)selectedTopic:(id)sender {
}
@end
