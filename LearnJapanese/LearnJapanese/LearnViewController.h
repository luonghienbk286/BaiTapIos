//
//  LearnViewController.h
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface LearnViewController : UIViewController<AVAudioPlayerDelegate>
@property (strong, nonatomic) UILabel *labelText;
@property (strong,nonatomic) UIButton *buttonSpeaker;
@property (strong, nonatomic) AVAudioPlayer* audioPlayerExam;
@end
