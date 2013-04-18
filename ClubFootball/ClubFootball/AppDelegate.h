//
//  AppDelegate.h
//  ClubFootball
//
//  Created by MAC on 4/17/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{@public
    NSMutableArray *arrayTableClub;
    NSMutableArray *arrayPlayer;
    NSDictionary *dictionaryClub;
    NSArray *keys;
    NSMutableArray *arrayicon,*arrayName;
    int selectedCellClub,selectedCellPlayer;
}
@property (strong, nonatomic) UIWindow *window;

@end
