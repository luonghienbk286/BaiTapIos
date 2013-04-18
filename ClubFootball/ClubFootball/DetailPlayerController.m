//
//  DetailPlayerController.m
//  ClubFootball
//
//  Created by MAC on 4/17/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailPlayerController.h"
#import "AppDelegate.h"
@interface DetailPlayerController ()
{
    AppDelegate *delegate;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *namePlayer;
@property (weak, nonatomic) IBOutlet UITextField *numOfMatch;
@property (weak, nonatomic) IBOutlet UITextField *goals;
@property (weak, nonatomic) IBOutlet UITextField *numOfYellowCard;
@property (weak, nonatomic) IBOutlet UITextField *numOfRedCard;
@property (weak, nonatomic) IBOutlet UITextField *position;

@end

@implementation DetailPlayerController

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
 self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width,600);}
-(void)viewWillAppear:(BOOL)animated{
    delegate= [UIApplication sharedApplication].delegate;
    NSMutableDictionary*dictionary =[delegate->arrayPlayer objectAtIndex:delegate->selectedCellPlayer];
    self.namePlayer.text=[dictionary objectForKey:@"namePlayer"];
    self.numOfMatch.text=[[dictionary objectForKey:@"sotranchoi"] stringValue];
    self.goals.text=[[dictionary objectForKey:@"sobanghi"] stringValue];
    self.numOfYellowCard.text=[[dictionary objectForKey:@"yellowcard"] stringValue];
    self.numOfRedCard.text=[[dictionary objectForKey:@"redcard"] stringValue];
    self.position.text=[dictionary objectForKey:@"vitri"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
