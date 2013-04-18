//
//  DetailClubController.m
//  ClubFootball
//
//  Created by MAC on 4/17/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "DetailClubController.h"
#import "AppDelegate.h"
#import "PlayerTableController.h"
@interface DetailClubController ()
{
    AppDelegate *delegate;
    PlayerTableController *playerTable;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *nameClub;
@property (weak, nonatomic) IBOutlet UITextField *ranking;
@property (weak, nonatomic) IBOutlet UITextField *numOfWin;
@property (weak, nonatomic) IBOutlet UITextField *numOfDraw;
@property (weak, nonatomic) IBOutlet UITextField *numOfLoss;
@property (weak, nonatomic) IBOutlet UITextField *sobanGhi;
@property (weak, nonatomic) IBOutlet UITextField *soBanThua;
@property (weak, nonatomic) IBOutlet UITextField *soTranDa;
@property (weak, nonatomic) IBOutlet UITextField *score;

@end

@implementation DetailClubController

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
    self.title=@"Detail Club";
    // Do any additional setup after loading the view from its nib.
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width,548);
    
    //self.soTranDa.text=[dictionary objectForKey:@"nameclub"];*/
}
-(void)viewWillAppear:(BOOL)animated{
    delegate= [UIApplication sharedApplication].delegate;
    NSMutableDictionary*dictionary =[delegate->arrayTableClub objectAtIndex:delegate->selectedCellClub];
    delegate->arrayPlayer=[dictionary objectForKey:@"cauthu"];
  //  NSLog(@"%@",delegate->arrayPlayer);
    int sotrandadau=[[dictionary objectForKey:@"win"] intValue]
    +[[dictionary objectForKey:@"draw"] intValue]
    +[[dictionary objectForKey:@"loss"] intValue];
    int score =[[dictionary objectForKey:@"win"] intValue]*3+[[dictionary objectForKey:@"draw"] intValue]*1;
    
    self.nameClub.text=[dictionary objectForKey:@"clubname"];
    self.ranking.text=[[dictionary objectForKey:@"ranking"] stringValue];
    self.numOfWin.text=[[dictionary objectForKey:@"win"] stringValue];
    self.numOfDraw.text=[[dictionary objectForKey:@"draw"] stringValue];
    self.numOfLoss.text=[[dictionary objectForKey:@"loss"] stringValue];
    self.sobanGhi.text=[[dictionary objectForKey:@"sobanthang"] stringValue];
    self.soBanThua.text=[[dictionary objectForKey:@"sobanthua"] stringValue];
    self.soTranDa.text=[NSString stringWithFormat:@"%d",sotrandadau];
    self.score.text=[NSString stringWithFormat:@"%d",score];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)listPlayer:(id)sender {
        if (!playerTable) {
        playerTable = [[PlayerTableController alloc] initWithNibName:@"PlayerTableController" bundle:nil];
    }
    
    [self.navigationController pushViewController:playerTable animated:YES];
}

@end
