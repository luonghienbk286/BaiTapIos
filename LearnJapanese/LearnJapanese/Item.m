//
//  Item.m
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Item.h"
#import "LearnManager.h"
#import "LearnViewController.h"
@interface Item()
{
    LearnManager *learnView;
    LearnViewController *learnViewCtrl;
}
@end
@implementation Item
-(id)initWithImageItem:(NSString *)image
             withSound:(NSString *)sound
             withWidth:(int)w
            withHeight:(int)h
         withExamSound:(NSString *)exSound
          withExamWord:(NSString *)exWord{
    if(self =[super init]){
        self.imageItem=image;
        self.nameSound=sound;
        self->width =w;
        self->height=h;
        self.examSound=exSound;
        self.examWord=exWord;

            }
    return self;
}
-(void) phatAm:(id)sender1 withLearnViewCtrl:(id)sender2{
    learnView =(LearnManager *)sender1;
    learnViewCtrl =(LearnViewController *)sender2;
    UITapGestureRecognizer *tapRecognizer= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(read:)];
   [self.tranformView addGestureRecognizer: tapRecognizer];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:self.nameSound ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error];
    if (error) {
        NSLog(@"Error %@", error.description);
        return;
    }
    [self.audioPlayer prepareToPlay];
}
-(void) read:(UITapGestureRecognizer *) gesture{
    if(learnViewCtrl.audioPlayerExam.playing==NO){
[self.audioPlayer play];
    learnViewCtrl.labelText.text=self.examWord;
    [UIView transitionWithView:self.tranformView duration:0.2 options: UIViewAnimationOptionTransitionFlipFromTop animations:^{
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:1.0 animations:^ (void) {
                learnViewCtrl.labelText.center = CGPointMake(240, 380);
            }completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 animations:^ (void) {
                learnViewCtrl.buttonSpeaker.center=CGPointMake(40, 380);
                }];
            }];
    }];
}
}
@end
