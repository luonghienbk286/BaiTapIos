//
//  AppDelegate.m
//  ClubFootball
//
//  Created by MAC on 4/17/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "AppDelegate.h"
#import "PLTableController.h"
#import "newsTableController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    PLTableController * plTable = [[PLTableController alloc] initWithNibName:@"PLTableController" bundle:nil];
    
    
    newsTableController * newsTable = [[newsTableController alloc] initWithNibName:@"newsTableController" bundle:nil];
    UINavigationController * nC1 = [[UINavigationController alloc] initWithRootViewController:plTable];
    nC1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Premier League" image:[UIImage imageNamed:@"0088"] tag:1];
    nC1.tabBarItem.badgeValue = @"20";
    
    UINavigationController * nC2 = [[UINavigationController alloc] initWithRootViewController:newsTable];
    nC2.tabBarItem = [[UITabBarItem alloc ] initWithTitle:@"News" image:[UIImage imageNamed:@"0089"] tag:2];
    nC2.tabBarItem.badgeValue = @"6";
    
    UITabBarController * tabBar = [[UITabBarController alloc] init];    
    tabBar.viewControllers = @[nC1,nC2];

    keys =[[NSArray alloc] initWithObjects:@"clubname",@"ranking",@"icon",@"numOfMatch",@"win",@"draw",@"loss",@"sobanthang",@"sobanthua", nil];
    NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"club" ofType:@"plist"];
    arrayTableClub=[[NSMutableArray alloc] initWithContentsOfFile:dataPath];
    
    
    
     self.window.rootViewController = tabBar;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
