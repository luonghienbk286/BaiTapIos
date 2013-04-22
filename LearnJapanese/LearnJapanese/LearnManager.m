//
//  LearnManager.m
//  LearnJapanese
//
//  Created by MAC on 4/21/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "LearnManager.h"
#import "LearnViewController.h"
#import "TopicViewController.h"
#define SIZE_VIEWITEM 64
#define SIZE_VIEWTOPIC 128
@interface LearnManager(){
    @public
    LearnViewController * learnCtrl;
    TopicViewController * topicCtrl;
    Item *item;
}
@end
@implementation LearnManager
-(id)initLearnManagerWithTopic:(Topic *) topic{
    if(self =[super init]){
        self.topic=topic;
    }
    return self;
}
-(id)init{
    if(self =[super init]){
        
    }
    return self;

}
-(void)drawItem:(id) sender{
     learnCtrl=(LearnViewController *) sender;
    NSMutableArray *arrayItem=self.topic.arrayItem;
    for(int i=0;i<[arrayItem count];i++){
        item = [arrayItem objectAtIndex:i];
          item.tranformView=[[UIView alloc] initWithFrame:CGRectMake(item->width, item->height, SIZE_VIEWITEM, SIZE_VIEWITEM)];
        NSLog(@"%@",item.imageItem);
        NSString *name =[NSString stringWithFormat:@"%@.ico",item.imageItem];
        item.imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
        item.imageView.frame=CGRectMake(0,0,item.tranformView.bounds.size.width, item.tranformView.bounds.size.height);
        [item.tranformView addSubview:item.imageView];
        [learnCtrl.view addSubview:item.tranformView];
        [item phatAm:self withLearnViewCtrl:sender];
       
    }
}
-(void)drawTopic:(id)sender withArrayTopic:(NSMutableArray *)arrayTopic{
    topicCtrl=(TopicViewController *) sender;
    for(int i=0;i<[arrayTopic count];i++){
        Topic *top =[arrayTopic objectAtIndex:i];
        top.viewTopic=[[UIView alloc] initWithFrame:CGRectMake(top->width, top->height, SIZE_VIEWTOPIC, SIZE_VIEWTOPIC)];
        NSString *nameTopic =[NSString stringWithFormat:@"%@.ico",top.nameTopic];
        top.imageViewTopic=[[UIImageView alloc] initWithImage:[UIImage imageNamed:nameTopic]];
        top.imageViewTopic.frame=CGRectMake(0,0,top.viewTopic.bounds.size.width, top.viewTopic.bounds.size.height);
        [top.viewTopic addSubview:top.imageViewTopic];
        [topicCtrl.view addSubview:top.viewTopic];
        [top phatAmTopic:self withTopicViewController:topicCtrl];
    }
}

@end
