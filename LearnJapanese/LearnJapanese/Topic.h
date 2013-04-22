//
//  Topic.h
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import <AVFoundation/AVFoundation.h>
@interface Topic : NSObject
{@public
    int width;
    int height;
}
@property (strong,nonatomic) NSMutableArray *arrayItem;
@property (strong,nonatomic) NSString *imageTopic;
@property (strong,nonatomic) NSString *nameTopic;
@property (strong,nonatomic) NSString *nameSound;

@property (nonatomic,strong) UIView *viewTopic;
@property (nonatomic,strong) UIImageView *imageViewTopic;
@property (strong, nonatomic) AVAudioPlayer* audioPlayerTopic;
-(id)initWithImageTopic:(NSString *) image
              withSound:(NSString *) sound
              withWidth:(int ) w
             withHeight:(int ) h
          withNameTopic:(NSString *) name;
-(void) phatAmTopic:(id) sender1 withTopicViewController:(id) sender2;
@end
