//
//  HRAppDelegate.h
//  Hooray
//
//  Created by luan on 4/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HRChooseLangues;

@interface HRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HRChooseLangues *viewController;
@property (strong, nonatomic) UINavigationController *ncviewController;
+ (HRAppDelegate *)shareAppDelegate;
- (BOOL)isTall;
-(BOOL)IAPItemPurchased;
@end
