//
//  Grid.h
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grid : NSObject

{@public
    float widthGrid;
    float heightGrid;
    float xGrid;
    float yGrid;
    BOOL isFlip;
    int  numberPos;
    BOOL isCompleted;
    UIView *tranformM;
    UIImageView *imag;
}
@property (nonatomic,strong) UIImage *image1;
@property (nonatomic,strong) UIImage *image2;
@property (nonatomic,strong) UIImageView *imageview;
-(id)initWithWidthGrid:(float)width
        withHeightGrid:(float)height
             withImage:(UIImage *)image1
             withImage:(UIImage *)image2
             withXGrid:(float ) x
             withYGrid:(float ) y
         withNumberPos:(int) num;
+(id)sharedManager;
-(void) tranformImage:(id) sender;
-(void) deleteImage;
@end

