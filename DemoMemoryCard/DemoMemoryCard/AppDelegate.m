//
//  AppDelegate.m
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "AppDelegate.h"
#import "GameLevel.h"
#import "Grid.h"
#define numOfGridLevel1 4
#define numOfGridLevel2 8
#define numOfGridLevel3 12
#define numOfGridLevel4 16
#define timePlayLevel1 12
#define timePlayLevel2 30
#define timePlayLevel3 60
#define timePlayLevel4 90
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    
    
    ////////
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.mainController = [[MainController alloc] initWithNibName:@"MainController" bundle:nil];
    self.window.rootViewController = self.mainController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    flag=0;
    sole=0;
    level=1;
    numberOfCard=0;
    TimeInterval=1;
    image1=[UIImage imageNamed:@"02.png"];
    _width =image1.size.width;
    _height=image1.size.height;
    //gameManager =[GameManager sharedManager];
    // Override point for customization after application launch.
    arrayImgLevel =[[NSArray alloc] initWithObjects:[UIImage imageNamed:@"01.ico"],
                    [UIImage imageNamed:@"02.ico"],
                    [UIImage imageNamed:@"03.ico"],
                    [UIImage imageNamed:@"04.ico"], nil];
    arrayPosImgLevel=[[NSArray alloc] initWithObjects:
                      [NSValue valueWithCGSize:CGSizeMake(70, 100)],
                      [NSValue valueWithCGSize:CGSizeMake(186, 100)],
                      [NSValue valueWithCGSize:CGSizeMake(70, 264)],
                      [NSValue valueWithCGSize:CGSizeMake(186,260)],nil];
    /////////////////// Level1
    arrayImage2Level[0] =[[NSMutableArray alloc] initWithObjects:@"math6.ico",@"math23.ico",@"math6.ico",@"math23.ico",nil];
    arrayGrid[0] =[[NSMutableArray alloc] init];
    arrayPosLevel[0] =[[NSMutableArray alloc] initWithObjects:
                       [NSValue valueWithCGSize:CGSizeMake(93, 173)],
                       [NSValue valueWithCGSize:CGSizeMake(227,173)],
                       [NSValue valueWithCGSize:CGSizeMake(93,307)],
                       [NSValue valueWithCGSize:CGSizeMake(227,307)],nil];
    for(int i=0;i<numOfGridLevel1;i++)
    {
        UIImage *image2 =[UIImage imageNamed:[arrayImage2Level[0] objectAtIndex:i]];
        CGSize size=[[arrayPosLevel[0] objectAtIndex:i] CGSizeValue];
        Grid *grid =[[Grid alloc] initWithWidthGrid:_width withHeightGrid:_height withImage:image1 withImage:image2 withXGrid:size.width withYGrid:size.height withNumberPos:i];
        [arrayGrid[0] addObject:grid];
    }
    level1 =[[GameLevel alloc] initWithLevel:1 withNumberOfGrid:numOfGridLevel1 withArrayGrid:arrayGrid[0] withArrayPos:arrayPosLevel[0] withArrayImage:arrayImage2Level[0] withTimePlay:timePlayLevel1];
    //////////Level3
    arrayImage2Level[2] =[[NSMutableArray alloc] initWithObjects:@"logo1",@"logo2",@"logo4",@"logo6",@"logo5",@"logo2",@"logo3",@"logo5",@"logo6",@"logo1",@"logo3",@"logo4",nil];
    arrayGrid[2] =[[NSMutableArray alloc] init];
    arrayPosLevel[2] =[[NSMutableArray alloc] initWithObjects:
                       [NSValue valueWithCGSize:CGSizeMake(43, 62)],
                       [NSValue valueWithCGSize:CGSizeMake(277,62)],
                       [NSValue valueWithCGSize:CGSizeMake(121,151)],
                       [NSValue valueWithCGSize:CGSizeMake(199,151)],
                       [NSValue valueWithCGSize:CGSizeMake(43,240)],
                       [NSValue valueWithCGSize:CGSizeMake(121,240)],
                       [NSValue valueWithCGSize:CGSizeMake(199,240)],
                       [NSValue valueWithCGSize:CGSizeMake(277,240)],
                       [NSValue valueWithCGSize:CGSizeMake(121,329)],
                       [NSValue valueWithCGSize:CGSizeMake(199,329)],
                       [NSValue valueWithCGSize:CGSizeMake(43,418)],
                       [NSValue valueWithCGSize:CGSizeMake(277,418)],nil];
    for(int i=0;i<numOfGridLevel3;i++)
    {
        UIImage *image2 =[UIImage imageNamed:[arrayImage2Level[2] objectAtIndex:i]];
        CGSize size=[[arrayPosLevel[2] objectAtIndex:i] CGSizeValue];
        Grid *grid =[[Grid alloc] initWithWidthGrid:_width withHeightGrid:_height withImage:image1 withImage:image2 withXGrid:size.width withYGrid:size.height withNumberPos:i];
        [arrayGrid[2] addObject:grid];
    }
    level3=[[GameLevel alloc] initWithLevel:3 withNumberOfGrid:numOfGridLevel3 withArrayGrid:arrayGrid[2] withArrayPos:arrayPosLevel[2] withArrayImage:arrayImage2Level[2] withTimePlay:timePlayLevel3];
    //////////Level2
    arrayImage2Level[1] =[[NSMutableArray alloc] initWithObjects:@"logo1",@"logo4",@"logo3",@"logo2",@"logo2",@"logo4",@"logo3",@"logo1",nil];
    arrayGrid[1] =[[NSMutableArray alloc] init];
    arrayPosLevel[1] =[[NSMutableArray alloc] initWithObjects:
                       [NSValue valueWithCGSize:CGSizeMake(44, 82)],
                       [NSValue valueWithCGSize:CGSizeMake(276,82)],
                       [NSValue valueWithCGSize:CGSizeMake(83,161)],
                       [NSValue valueWithCGSize:CGSizeMake(237,161)],
                       [NSValue valueWithCGSize:CGSizeMake(122,240)],
                       [NSValue valueWithCGSize:CGSizeMake(198,240)],
                       [NSValue valueWithCGSize:CGSizeMake(160,319)],
                       [NSValue valueWithCGSize:CGSizeMake(160,408)],nil];
    for(int i=0;i<numOfGridLevel2;i++)
    {
        UIImage *image2 =[UIImage imageNamed:[arrayImage2Level[1] objectAtIndex:i]];
        CGSize size=[[arrayPosLevel[1] objectAtIndex:i] CGSizeValue];
        Grid *grid =[[Grid alloc] initWithWidthGrid:_width withHeightGrid:_height withImage:image1 withImage:image2 withXGrid:size.width withYGrid:size.height withNumberPos:i];
        [arrayGrid[1] addObject:grid];
    }
    level2=[[GameLevel alloc] initWithLevel:2 withNumberOfGrid:numOfGridLevel2 withArrayGrid:arrayGrid[1] withArrayPos:arrayPosLevel[1] withArrayImage:arrayImage2Level[1] withTimePlay:timePlayLevel2];
    //////////Level4
    arrayImage2Level[3] =[[NSMutableArray alloc] initWithObjects:@"logo1",@"logo4",@"logo8",@"logo5",@"logo6",@"logo3",@"logo7",@"logo3",@"logo7",@"logo8",@"logo2",@"logo5",@"logo2",@"logo4",@"logo6",@"logo1",nil];
    arrayGrid[3] =[[NSMutableArray alloc] init];
    arrayPosLevel[3] =[[NSMutableArray alloc] initWithObjects:
                       [NSValue valueWithCGSize:CGSizeMake(46, 102)],
                       [NSValue valueWithCGSize:CGSizeMake(122,102)],
                       [NSValue valueWithCGSize:CGSizeMake(198,102)],
                       [NSValue valueWithCGSize:CGSizeMake(274,102)],
                       [NSValue valueWithCGSize:CGSizeMake(46,194)],
                       [NSValue valueWithCGSize:CGSizeMake(122,194)],
                       [NSValue valueWithCGSize:CGSizeMake(198,194)],
                       [NSValue valueWithCGSize:CGSizeMake(274,194)],
                       [NSValue valueWithCGSize:CGSizeMake(46,286)],
                       [NSValue valueWithCGSize:CGSizeMake(122,286)],
                       [NSValue valueWithCGSize:CGSizeMake(198,286)],
                       [NSValue valueWithCGSize:CGSizeMake(274,286)],
                       [NSValue valueWithCGSize:CGSizeMake(46,362)],
                       [NSValue valueWithCGSize:CGSizeMake(122,362)],
                       [NSValue valueWithCGSize:CGSizeMake(198,362)],
                       [NSValue valueWithCGSize:CGSizeMake(274,362)],nil];
    for(int i=0;i<numOfGridLevel4;i++)
    {
        UIImage *image2 =[UIImage imageNamed:[arrayImage2Level[3] objectAtIndex:i]];
        CGSize size=[[arrayPosLevel[3] objectAtIndex:i] CGSizeValue];
        Grid *grid =[[Grid alloc] initWithWidthGrid:_width withHeightGrid:_height withImage:image1 withImage:image2 withXGrid:size.width withYGrid:size.height withNumberPos:i];
        [arrayGrid[3] addObject:grid];
    }
    level4=[[GameLevel alloc] initWithLevel:4 withNumberOfGrid:numOfGridLevel4 withArrayGrid:arrayGrid[3] withArrayPos:arrayPosLevel[3] withArrayImage:arrayImage2Level[3] withTimePlay:timePlayLevel4];
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
