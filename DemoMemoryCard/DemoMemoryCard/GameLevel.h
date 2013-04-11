//
//  GameLevel.h
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameLevel : NSObject
{
    
}
@property (nonatomic,strong) NSString *nameSound;
@property (nonatomic,strong) NSMutableArray *arrayGrid;
@property (nonatomic,strong) NSMutableArray *arrayPos;
@property (nonatomic,strong) NSMutableArray *arrayImage;
@property int numberOfGrid;
@property int levelGame;
@property int timePlay;
-(id) initWithLevel:(int) level
   withNumberOfGrid:(int) number
      withArrayGrid:(NSMutableArray *)arrayGrid
       withArrayPos:(NSMutableArray *) arrayPos
     withArrayImage:(NSMutableArray *) arrayImage
withTimePlay:(int) time;
+(id) sharedManager;
@end
