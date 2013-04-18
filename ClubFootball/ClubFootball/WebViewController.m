//
//  WebViewController.m
//  ClubFootball
//
//  Created by MAC on 4/18/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
{
    UIActivityIndicatorView *indicator;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    //[indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE; 
    NSURL *url=[NSURL URLWithString:self.link];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];
}
- (void)viewDidLoad
{
    [indicator removeFromSuperview];
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
[indicator startAnimating];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
[indicator stopAnimating];
    //indicator=nil;
    //[indicator removeFromSuperview];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
