//
//  Item.h
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface Item : NSObject
{@public
    int width;
    int height;
}
@property (strong, nonatomic) AVAudioPlayer* audioPlayer;
@property (strong,nonatomic) NSString *imageItem;
@property (strong,nonatomic) NSString *nameSound;
@property (strong,nonatomic) NSString *imageWord;
@property (strong,nonatomic) NSString *examSound;
@property (strong,nonatomic) NSString *examWord;
@property (strong,nonatomic) UIImageView *imageView;
@property (nonatomic,strong) UIView *tranformView;
-(id)initWithImageItem:(NSString *) image
             withSound:(NSString *) sound
             withWidth:(int) w
            withHeight:(int) h
         withExamSound:(NSString *) exSound
          withExamWord:(NSString *) exWord;
-(void) phatAm:(id)sender1 withLearnViewCtrl:(id)sender2;
@end
