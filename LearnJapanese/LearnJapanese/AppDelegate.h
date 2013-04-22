//
//  AppDelegate.h
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicViewController.h"
#import "LearnViewController.h"
#import "Topic.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TopicViewController *topicViewController;
@property (strong,nonatomic) LearnViewController *learn;
@property (nonatomic,strong) Topic *topicSelected;
@end
