//
//  GameManager.m
//  DemoMemoryCard
//
//  Created by MAC on 4/10/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "GameManager.h"
#import "MainController.h"
#import "AppDelegate.h"
#import "Grid.h"
@interface GameManager (){
    UIView *tranformM;
    UIImageView *imag;
    AppDelegate *delega;
    MainController *mainCtrl;
    Grid *grid;
    Grid *myGrid;
}
@end
@implementation GameManager
-(void)selectLevel:(int)lev{
    _gameLevel.levelGame=lev;
   

}
+(id)sharedManager{
    static GameManager *gameManager = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        gameManager =[GameManager new];
    });
    return gameManager;
}
-(id)initWithLevel:(GameLevel *)gameLv{
    if (self = [super init]) {
    self.gameLevel=gameLv;
         delega= [UIApplication sharedApplication].delegate;
    }
    return self;
}
-(void)tranformImage:(id) sender withGrid:(Grid *) mygrid  {
    
    mainCtrl=(MainController *) sender;
    myGrid=mygrid;
    //NSLog(@"Pos:%d",myGrid->numberPos);
    myGrid->tranformM =[[UIView alloc] initWithFrame:CGRectMake(myGrid->xGrid-32, myGrid->yGrid-32, 64, 64)];
   // NSLog(@"%f----%f",xGrid,yGrid);
    myGrid.imageview.frame = CGRectMake(0, 0, tranformM.bounds.size.width, tranformM.bounds.size.height);
    //_imageview.userInteractionEnabled = YES;
    // grid.imageview.frame=tranform.frame;
    [mainCtrl.view addSubview:myGrid->tranformM];
    [myGrid->tranformM addSubview:myGrid.imageview];
    
    imag =[[UIImageView alloc] initWithImage:myGrid.image2];
    imag.frame = CGRectMake(0, 0, myGrid->tranformM.bounds.size.width, myGrid->tranformM.bounds.size.height);
    imag.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipp:)];
    [myGrid->tranformM addGestureRecognizer:tapA];
    
}
-(void) flipp:(UITapGestureRecognizer *) gesture
{
    if(myGrid->isFlip==NO&&myGrid->isCompleted==YES)//kiem tra xem imageview da flip chua neu flip thi da complete chua
    {
        NSLog(@"%d",self.gameLevel.numberOfGrid);
        for(int j=0;j<self.gameLevel.numberOfGrid;j++ ){
            Grid *gr =[self.gameLevel.arrayGrid objectAtIndex:j];
            gr->isCompleted=NO;
        }
        NSLog(@"delegate:%d",delega->flag);
        delega->flag=delega->flag+1;
        grid  =[self.gameLevel.arrayGrid objectAtIndex:delega->sole];
        if(delega->flag==2){
            if([[self.gameLevel.arrayImage objectAtIndex:myGrid->numberPos] isEqualToString:[self.gameLevel.arrayImage objectAtIndex:grid->numberPos]]){
                // NSLog(@"Yes okie");
                [UIView transitionWithView:tranformM duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                    [myGrid->tranformM addSubview:imag ];
                    [myGrid.imageview removeFromSuperview];
                } completion:^(BOOL finished) {
                    myGrid->isFlip=YES;
                    grid->isFlip=YES;
                    delega->flag=0;
                    for(int j=0;j<self.gameLevel.numberOfGrid;j++ ){
                        Grid *gr =[self.gameLevel.arrayGrid objectAtIndex:j];
                        gr->isCompleted=YES;
                    }
                }];
            }else{
                [UIView transitionWithView:tranformM duration:0.7 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
                    [myGrid->tranformM addSubview:imag ];
                    [myGrid.imageview removeFromSuperview];
                    NSLog(@"flag:%d",delega->flag);
                    
                    
                } completion:^(BOOL finished){
                    
                    [UIView transitionWithView:tranformM duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
                        [myGrid->tranformM addSubview:myGrid.imageview ];
                        [imag removeFromSuperview];
                        
                    } completion:^(BOOL finished){
                        
                        myGrid->isCompleted=NO;
                        [UIView transitionWithView:grid->tranformM duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
                            [grid->tranformM addSubview:grid.imageview ];
                            [grid->imag removeFromSuperview];
                            
                        } completion:^(BOOL finished){
                            grid->isFlip=NO;
                            //delegate->sole=0;
                            delega->flag=0;
                            for(int j=0;j<self.gameLevel.numberOfGrid;j++ ){
                                Grid *gr =[self.gameLevel.arrayGrid objectAtIndex:j];
                                gr->isCompleted=YES;
                            }
                        }];
                        
                    }];
                }];
            }
        }else{
            [UIView transitionWithView:myGrid->tranformM duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
                [myGrid->tranformM addSubview:imag ];
                [myGrid.imageview removeFromSuperview];
                
            } completion:^(BOOL finished){
                myGrid->isFlip=YES;
                delega->sole=myGrid->numberPos;
                for(int j=0;j<self.gameLevel.numberOfGrid
                    ;j++ ){
                    Grid *gr =[self.gameLevel.arrayGrid objectAtIndex:j];
                    gr->isCompleted=YES;
                }
            }];
        } /*else{
           [UIView transitionWithView:tranformM duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft  animations:^{
           [tranformM addSubview:_imageview ];
           [imag removeFromSuperview];
           
           } completion:^(BOOL finished){
           isFlip=NO;
           }];
           
           } */
    }else{
        NSLog(@"chua an duoc");
    }
}

@end
