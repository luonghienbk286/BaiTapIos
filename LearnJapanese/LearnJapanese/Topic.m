//
//  Topic.m
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Topic.h"
#import "LearnManager.h"
#import "TopicViewController.h"
#import "AppDelegate.h"
@interface Topic(){
    LearnManager *learnManager;
    TopicViewController *topicViewCtrl;
    AppDelegate *delegate;
}
@end
@implementation Topic
-(id)initWithImageTopic:(NSString *) image
              withSound:(NSString *) sound
              withWidth:(int ) w
             withHeight:(int ) h
          withNameTopic:(NSString *)name{

    if (self = [super init]){
        self.imageTopic =image;
        self.nameSound=sound;
        self->width = w;
        self->height = h;
        self.nameTopic=name;
                
    }
    return self;
}
-(void) phatAmTopic:(id) sender1 withTopicViewController:(id)sender2{
    delegate= [UIApplication sharedApplication].delegate;
    learnManager=(LearnManager *)sender1;
    topicViewCtrl =(TopicViewController *) sender2;
    UITapGestureRecognizer *tapRecognizer= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(read:)];
    [self.viewTopic addGestureRecognizer: tapRecognizer];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:self.nameSound ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    self.audioPlayerTopic = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error];
    if (error) {
        NSLog(@"Error %@", error.description);
        return ;
    }
    [self.audioPlayerTopic prepareToPlay];
 
}
-(void) read:(UITapGestureRecognizer *) gesture{
  
    delegate.topicSelected=self;
  
    [UIView animateWithDuration:1.2 animations:^ (void) {
        [self.audioPlayerTopic play];
    }completion:^(BOOL finished) {
            topicViewCtrl.learnView = [[LearnViewController alloc] initWithNibName:@"LearnViewController" bundle:nil];
            [topicViewCtrl.navigationController pushViewController:topicViewCtrl.learnView animated:YES];
    }];
}
@end
