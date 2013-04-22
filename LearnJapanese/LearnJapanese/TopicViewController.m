//
//  TopicViewController.m
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "TopicViewController.h"
#import "Topic.h"
#import "LearnManager.h"
#define NUM_TOPIC 4
@interface TopicViewController ()
{
    NSMutableDictionary *dictionary;
    NSMutableArray *arrayTopic;
    LearnManager *learnManager;
    Topic *topic[NUM_TOPIC];
}
@end

@implementation TopicViewController

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
    self.title=@"Learn Japanese";
    [super viewDidLoad];
    arrayTopic =[[NSMutableArray alloc] init];
    NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"topic" ofType:@"plist"];
    NSMutableArray *array=[[NSMutableArray alloc] initWithContentsOfFile:dataPath];
    for(int i=0;i<[array count];i++){
        dictionary =[array objectAtIndex:i];
        NSString *nameTopic =[dictionary objectForKey:@"nameTopic"];
        NSString *imageTopic=[dictionary objectForKey:@"nameTopic"];
        NSString *nameSound=[dictionary objectForKey:@"nameSound"];
        int width =[[dictionary objectForKey:@"width"] intValue];
        int height =[[dictionary objectForKey:@"height"] intValue];
        topic[i] =[[Topic alloc] initWithImageTopic:imageTopic withSound:nameSound withWidth:width withHeight:height withNameTopic:nameTopic];
        [arrayTopic addObject:topic[i]];
    }
    learnManager =[[LearnManager alloc] init];
    [learnManager drawTopic:self withArrayTopic:arrayTopic];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
