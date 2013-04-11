//
//  Grid.m
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Grid.h"
#import "MainController.h"
#import "AppDelegate.h"
#import "PlayGameController.h"
@interface Grid (){
    
    
    AppDelegate *delegate;
    PlayGameController *playCtrl;
    Grid *grid;
    NSTimer *timer ;
    int secondLeft;
    UILabel *label;
}
@end
@implementation Grid
-(id)initWithWidthGrid:(float)width
        withHeightGrid:(float)height
             withImage:(UIImage *)image1
             withImage:(UIImage *)image2
             withXGrid:(float)x
             withYGrid:(float)y
         withNumberPos:(int) num{
    if (self = [super init]){
        widthGrid =width;
        heightGrid =height;
        _image1=image1;
        _image2=image2;
        _imageview=[[UIImageView alloc] initWithImage:_image1];
        xGrid=x;
        yGrid=y;
        numberPos=num;
        isFlip=NO;
        isCompleted=YES;
        delegate= [UIApplication sharedApplication].delegate;
        
    }
    return self;
}
-(void)tranformImage:(id) sender  {
    
    playCtrl=(PlayGameController *) sender;
   
    tranformM =[[UIView alloc] initWithFrame:CGRectMake(xGrid-32, yGrid-32, 64, 64)];
    NSLog(@"%f----%f",xGrid,yGrid);
    _imageview.frame = CGRectMake(0, 0, tranformM.bounds.size.width, tranformM.bounds.size.height);
    //_imageview.userInteractionEnabled = YES;
    // grid.imageview.frame=tranform.frame;
    [playCtrl.view addSubview:tranformM];
    [tranformM addSubview:_imageview];
    
    imag =[[UIImageView alloc] initWithImage:_image2];
    imag.frame = CGRectMake(0, 0, tranformM.bounds.size.width, tranformM.bounds.size.height);
    imag.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipp:)];
    [tranformM addGestureRecognizer:tapA];
   
}

-(void) deleteImage{
    [UIView transitionWithView:self->tranformM duration:1 options:UIViewAnimationOptionTransitionCurlDown  animations:^{
        if(self->isFlip==YES){
        [self->imag removeFromSuperview];
        }else{
        [self.imageview removeFromSuperview];
        }
        
    } completion:^(BOOL finished){}];
    //}

}
-(void) flipp:(UITapGestureRecognizer *) gesture
{
    if(isFlip==NO&&isCompleted==YES)//kiem tra xem imageview da flip chua neu flip thi da complete chua
    {
        NSLog(@"%d",delegate->gameManager.gameLevel.numberOfGrid);
        for(int j=0;j<delegate->gameManager.gameLevel.numberOfGrid;j++ ){
            Grid *gr =[delegate->gameManager.gameLevel.arrayGrid objectAtIndex:j];
            gr->isCompleted=NO;
        }
        delegate->flag=delegate->flag+1;
        grid  =[delegate->gameManager.gameLevel.arrayGrid objectAtIndex:delegate->sole];
        if(delegate->flag==2){
                       
            if([[delegate->gameManager.gameLevel.arrayImage objectAtIndex:numberPos] isEqualToString:[delegate->gameManager.gameLevel.arrayImage objectAtIndex:grid->numberPos]]){
                delegate->numberOfCard=delegate->numberOfCard+2;

                
                [UIView transitionWithView:tranformM duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                    [tranformM addSubview:imag ];
                    [_imageview removeFromSuperview];
                } completion:^(BOOL finished) {
                    isFlip=YES;
                    grid->isFlip=YES;
                    delegate->flag=0;
                    for(int j=0;j<delegate->gameManager.gameLevel.numberOfGrid;j++ ){
                        Grid *gr =[delegate->gameManager.gameLevel.arrayGrid objectAtIndex:j];
                        gr->isCompleted=YES;
                    }
                    if(delegate->numberOfCard==delegate->gameManager.gameLevel.numberOfGrid){
                        if(delegate->level<4){
                            delegate->level=delegate->level+1;
                            [playCtrl viewDidUnload];
                            [playCtrl viewDidLoad];
                            delegate->numberOfCard=0;
                            [delegate.timer invalidate];
                        }else if(delegate->level==4){
                            [UIView transitionWithView:playCtrl.view duration:1 options:UIViewAnimationOptionTransitionCurlDown  animations:^{
                                 [delegate->imageView1 removeFromSuperview];
                                   [playCtrl.view addSubview:delegate->imageView2];
                                } completion:^(BOOL finished){                        }
                             ];
                        }
                       // }
                    //}
                    }
                }];
            }else{
                [UIView transitionWithView:tranformM duration:0.7 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
                    [tranformM addSubview:imag ];
                    [_imageview removeFromSuperview];
                    NSLog(@"flag:%d",delegate->flag);
                    
                    
                } completion:^(BOOL finished){
                    
                    [UIView transitionWithView:tranformM duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
                        [tranformM addSubview:_imageview ];
                        [imag removeFromSuperview];
                        
                    } completion:^(BOOL finished){
                        
                        isCompleted=NO;
                        [UIView transitionWithView:grid->tranformM duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
                            [grid->tranformM addSubview:grid.imageview ];
                            [grid->imag removeFromSuperview];
                            
                        } completion:^(BOOL finished){
                            grid->isFlip=NO;
                            //delegate->sole=0;
                            delegate->flag=0;
                            for(int j=0;j<delegate->gameManager.gameLevel.numberOfGrid;j++ ){
                                Grid *gr =[delegate->gameManager.gameLevel.arrayGrid objectAtIndex:j];
                                gr->isCompleted=YES;
                            }
                        }];
                        
                    }];
                }];
            }
        }else{
            [UIView transitionWithView:tranformM duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
                [tranformM addSubview:imag ];
                [_imageview removeFromSuperview];
                
            } completion:^(BOOL finished){
                isFlip=YES;
                delegate->sole=numberPos;
                for(int j=0;j<delegate->gameManager.gameLevel.numberOfGrid
                               ;j++ ){
                    Grid *gr =[delegate->gameManager.gameLevel.arrayGrid objectAtIndex:j];
                    gr->isCompleted=YES;
                }
            }];
        } 
    }else{
        NSLog(@"chua an duoc");
    }
}
+(id)sharedManager{
    static Grid *grid = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        grid =[Grid new];
    });
    return grid;
}

@end