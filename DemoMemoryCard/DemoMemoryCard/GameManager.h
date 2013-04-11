//
//  GameManager.h
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameLevel.h"
#import "Grid.h"
@interface GameManager : NSObject
{
}
@property (nonatomic,strong) NSMutableArray *arrayGridGame;
@property (nonatomic,assign) BOOL *saveState;
@property (nonatomic,assign) BOOL *loadStae;
@property (nonatomic,strong) GameLevel *gameLevel;
+(id) sharedManager;
-(void) selectLevel:(int )lev;
-(id) initWithLevel:(GameLevel *) gameLv;
-(void)tranformImage:(id) sender withGrid:(Grid *) mygrid;
@end
