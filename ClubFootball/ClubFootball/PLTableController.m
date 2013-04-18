//
//  PLTableController.m
//  ClubFootball
//
//  Created by MAC on 4/17/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "PLTableController.h"
#import "AppDelegate.h"
@interface PLTableController ()
{
   // NSDictionary *dictionaryTableClub;
   
    AppDelegate *delegate;
    NSMutableArray *arrayicon;
    NSMutableArray *arrayName;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation PLTableController

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
    self.title = @"PL Table";
    arrayicon=[[NSMutableArray alloc] init];
    arrayName=[[NSMutableArray alloc] init];
    delegate= [UIApplication sharedApplication].delegate;
    for(NSDictionary *object in delegate->arrayTableClub){
        //for (id key in object) {
        //NSLog(@"%@",[object objectForKey:key]);
        NSString *icon =[object objectForKey:@"icon"];
        NSString *name =[object objectForKey:@"clubname"];
        [arrayicon addObject:icon];
        [arrayName addObject:name];
        //}
        
    }

        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* result = nil;
    if ([tableView isEqual:self.tableView]){
        static NSString *MyCellIdentifier = @"SimpleCell";
        result = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
        //result.backgroundColor=[UIColor orangeColor];
        if (result == nil){
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellIdentifier];
        }
        result.textLabel.text =[arrayName objectAtIndex:indexPath.row];
        NSString *nameIcon =[arrayicon objectAtIndex:indexPath.row];
        result.imageView.image=[UIImage imageNamed:nameIcon];
      //tao ra mui ten tro sang ben
        result.detailTextLabel.text=@"53";
        result.accessoryType = UITableViewCellAccessoryDetailDisclosureButton; }
    //  UILabel *l1=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 100,100)];
    //UILabel *l1=[[UILabel alloc] initWithFrame:CGRectMake(240, 0, 40, 40)];
    //l1.text=@"53";
    //[result.contentView addSubview:l1];
    
    return result;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayicon count];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSInteger *row = [indexPath row];
    delegate->selectedCellClub=indexPath.row;
    if (!self.detailclubCtrl) {
        self.detailclubCtrl = [[DetailClubController alloc] initWithNibName:@"DetailClubController" bundle:nil];
    }
    
    [self.navigationController pushViewController:self.detailclubCtrl animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
