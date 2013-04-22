//
//  LearnManager.h
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic.h"
@interface LearnManager : NSObject
@property (nonatomic,strong) Topic *topic;

-(id)initLearnManagerWithTopic:(Topic *) topic;
-(void) drawItem:(id) sender;
-(void) drawTopic:(id) sender withArrayTopic:(NSMutableArray *) arrayTopic;
@end
