//
//  newsTableController.m
//  ClubFootball
//
//  Created by MAC on 4/17/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "newsTableController.h"
#import "WebViewController.h"
@interface newsTableController ()
{
    NSMutableArray *arrayTitle,*arrayLink;
    WebViewController *webViewController;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation newsTableController

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
    self.title=@"News";
    NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"newsLink" ofType:@"plist"];
    NSMutableArray *arrayNews=[[NSMutableArray alloc] initWithContentsOfFile:dataPath];
    arrayTitle=[[NSMutableArray alloc] init];
    arrayLink=[[NSMutableArray alloc] init];
    for(NSDictionary *object in arrayNews){
        NSString *title=[object objectForKey:@"title"];
        NSString *link =[object objectForKey:@"link"];
        [arrayTitle addObject:title];
        [arrayLink addObject:link];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* result = nil;
    if ([tableView isEqual:self.tableView]){
        static NSString *MyCellIdentifier = @"SimpleCell";
        result = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
        if (result == nil){
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellIdentifier];
        }
        result.textLabel.text =[arrayTitle objectAtIndex:indexPath.row];
        //tao ra mui ten tro sang ben
        //result.detailTextLabel.text=@"53";
        result.accessoryType = UITableViewCellAccessoryDetailDisclosureButton; }    
    return result;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayTitle count];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!webViewController) {
        webViewController = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    }
    webViewController.link=[arrayLink objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:webViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
