//
//  ViewController.m
//  InfiniteScrollView
//
//  Created by MAC on 4/25/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"
#define NUM_PHOTO 10
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self addImageWithName:@"10.jpg" atPosition:0];
    for(int i=1;i<NUM_PHOTO+1;i++){
    [self addImageWithName:[NSString stringWithFormat:@"%d.jpg",i] atPosition:i];
        
    }
    [self addImageWithName:@"1.jpg" atPosition:NUM_PHOTO+1];
    self.scrollView.contentSize = CGSizeMake((NUM_PHOTO+1)*320, 480);
	[self.scrollView scrollRectToVisible:CGRectMake(320,0,320,420) animated:NO];
}
- (void)addImageWithName:(NSString*)imageString atPosition:(int)position {
	// add image to scroll view
	UIImage *image = [UIImage imageNamed:imageString];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	imageView.frame = CGRectMake(position*320, 0, 320, 416);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
	[self.scrollView addSubview:imageView];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
		[scrollView scrollRectToVisible:CGRectMake((NUM_PHOTO)*320,0,320,480) animated:NO];
    }else if (scrollView.contentOffset.x == NUM_PHOTO*320) {
		[scrollView scrollRectToVisible:CGRectMake(0,0,320,420) animated:NO];
	}
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
