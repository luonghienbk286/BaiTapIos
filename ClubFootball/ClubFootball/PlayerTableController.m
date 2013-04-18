//
//  PlayerTableController.m
//  ClubFootball
//
//  Created by MAC on 4/17/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "PlayerTableController.h"
#import "AppDelegate.h"
#import "DetailPlayerController.h"
@interface PlayerTableController ()
{
    AppDelegate *delegate;
    NSMutableArray *arrayicon;
    NSMutableArray *arrayName;
    DetailPlayerController *detailPlayer;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation PlayerTableController

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
    self.title = @"Player Table";
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width,600);

}
-(void)viewWillAppear:(BOOL)animated{
    
    arrayName =[[NSMutableArray alloc] init];
    delegate= [UIApplication sharedApplication].delegate;
    //NSLog(@"%@",delegate->arrayPlayer);
    for(NSDictionary *object in delegate->arrayPlayer){
        //NSString *icon =[object objectForKey:@"icon"];
        NSString *name =[object objectForKey:@"namePlayer"];
        [arrayName addObject:name];
    }
    [self.tableView reloadData];
    NSLog(@"%@",arrayName);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //[tableView removeConstraints:arrayName];
    UITableViewCell* result = nil;
    if ([tableView isEqual:self.tableView]){
        static NSString *MyCellIdentifier = @"Simple";
        result = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
        //result.backgroundColor=[UIColor orangeColor];
        if (result == nil){
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellIdentifier];
        }
        result.textLabel.text =[arrayName objectAtIndex:indexPath.row];
                result.detailTextLabel.text=@"53";
        result.accessoryType = UITableViewCellAccessoryDetailDisclosureButton; }
        return result;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    delegate->selectedCellPlayer=indexPath.row;
    if (!detailPlayer) {
        detailPlayer = [[DetailPlayerController alloc] initWithNibName:@"DetailPlayerController" bundle:nil];
    }
    
    [self.navigationController pushViewController:detailPlayer animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
