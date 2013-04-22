//
//  LearnViewController.m
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "LearnViewController.h"
#import "Topic.h"
#import "LearnManager.h"
#import "AppDelegate.h"
#define NUM_ITEM 9
@interface LearnViewController ()
{
    AppDelegate *delegate;
    NSMutableArray *arrayItem;
    NSMutableDictionary *dictionary;
    Topic *topic;
    Item *item[NUM_ITEM];
    LearnManager *learnManager;
   
}
@end

@implementation LearnViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    delegate= [UIApplication sharedApplication].delegate;
    
    _labelText=[[UILabel alloc] initWithFrame:CGRectMake( 80, 540,320,50)];
    _labelText.backgroundColor =[UIColor clearColor];
    _labelText.textColor=[UIColor lightGrayColor];
    self.labelText.userInteractionEnabled=YES;
    _buttonSpeaker=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonSpeaker.frame=CGRectMake( 40, 540,32,32);
    [_buttonSpeaker setImage:[UIImage imageNamed:@"speaker.ico"] forState:UIControlStateNormal];
     self.buttonSpeaker.userInteractionEnabled=YES;
    [_buttonSpeaker addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonSpeaker];
    [self.view addSubview:self.labelText];
    arrayItem =[[NSMutableArray alloc] init];
    NSLog(@"ten file:%@",delegate.topicSelected.nameTopic);
    NSString *dataPath = [[NSBundle mainBundle]pathForResource:delegate.topicSelected.nameTopic ofType:@"plist"];
    NSMutableArray *array=[[NSMutableArray alloc] initWithContentsOfFile:dataPath];
    NSLog(@"%@",dataPath);
    for(int i=0;i<[array count];i++){
        dictionary =[array objectAtIndex:i];
        NSString *imageItem =[dictionary objectForKey:@"imageItem"];
       // NSString *imageWord=[dictionary objectForKey:@"imageWord"];
        NSString *sound =[dictionary objectForKey:@"sound"];
        int width =[[dictionary objectForKey:@"width"] intValue];
        int height =[[dictionary objectForKey:@"height"] intValue];
        NSString *exSound =[dictionary objectForKey:@"examSound"];
        NSString *exWord =[dictionary objectForKey:@"examWord"];
      item[i] =[[Item alloc] initWithImageItem:imageItem withSound:sound withWidth:width withHeight:height withExamSound:exSound withExamWord:exWord];
        [arrayItem addObject:item[i]];
    }
    topic=[[Topic alloc] initWithImageTopic:@"animal" withSound:@"animal" withWidth:50 withHeight:50 withNameTopic:@"animal"];
    topic.arrayItem=arrayItem;
   NSLog(@"%d",[topic.arrayItem count]);
    learnManager=[[LearnManager alloc]initLearnManagerWithTopic:topic];
     [learnManager drawItem:self ];
    
}
-(void) clickButton{
    for(int i=0;i<NUM_ITEM;i++){
        if([self.labelText.text isEqualToString:item[i].examWord]){
            NSString* filePath = [[NSBundle mainBundle] pathForResource:item[i].examSound ofType:@"mp3"];
            NSURL *url = [NSURL fileURLWithPath:filePath];
            NSError *error;
            self.audioPlayerExam = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error];
            if (error) {
                NSLog(@"Error %@", error.description);
                return;
            }
            [self.audioPlayerExam play];
        }
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
