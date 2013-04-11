//
//  GameLevel.m
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "GameLevel.h"

@implementation GameLevel
+(id)sharedManager{
    static GameLevel *gameLevel = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        gameLevel =[GameLevel new];
    });
    return gameLevel;
}
-(id)initWithLevel:(int)level
  withNumberOfGrid:(int)number
     withArrayGrid:(NSMutableArray *)arrayGrid
      withArrayPos:(NSMutableArray *)arrayPos
    withArrayImage:(NSMutableArray *)arrayImage
withTimePlay:(int)time{
    if (self = [super init]) {
        self.levelGame=level;
        self.numberOfGrid=number;
        self.arrayGrid=arrayGrid;
        self.arrayPos=arrayPos;
        self.arrayImage=arrayImage;
        self.timePlay=time;
    }
    return self;
}

@end
