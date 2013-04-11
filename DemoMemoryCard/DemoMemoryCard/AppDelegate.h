//
//  AppDelegate.h
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainController.h"
#import "GameLevel.h"
#import "GameManager.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
@public
    NSMutableArray *arrayImage2Level[4];
    NSMutableArray *arrayPosLevel[4];
    NSMutableArray *arrayGrid[4];
    GameManager *gameManager;
    GameLevel *level1;
    GameLevel *level2;
    GameLevel *level3;
    GameLevel *level4;
    UIImage *image1;
    NSArray *arrayImgLevel;
    NSArray *arrayPosImgLevel;
    int flag;
    int sole;
    int level;
    int numberOfCard;
    int TimeInterval;
    UIImageView *imageView1;
    UIImageView *imageView2;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) MainController *mainController;
@property (retain,nonatomic)  NSTimer *timer;

@property float width;
@property float height;

@end
