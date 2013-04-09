//
//  HRAppDelegate.m
//  Hooray
//
//  Created by luan on 4/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRAppDelegate.h"

#import "HRChooseLangues.h"

@implementation HRAppDelegate
@synthesize ncviewController;
- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}
//check iphone 4 oriphone5
- (BOOL)isTall
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    CGFloat height = bounds.size.height;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) && ((height * scale) >= 1000));
}

+ (HRAppDelegate *)shareAppDelegate
{
    return (HRAppDelegate*)[UIApplication sharedApplication].delegate;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [application setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    // Override point for customization after application launch.
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"en", nil] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.viewController = [[[HRChooseLangues alloc] initWithNibName:@"HRChooseLangues" bundle:nil] autorelease];
    ncviewController=[[UINavigationController alloc] initWithRootViewController:self.viewController];
    ncviewController.navigationBarHidden=YES;
    self.window.rootViewController = self.ncviewController;
    [self.window makeKeyAndVisible];
    [self setAnimationSplash];
    return YES;
}
#pragma set animation splash
-(void)setAnimationSplash
{
    UIImageView *imageView;
    if ([self isTall]) {
        imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default-568h"]];
    }
    else{
        imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default"]];
    }
    [self.window addSubview:imageView];
    CGRect frame=imageView.frame;
    frame.origin.y=-frame.size.height;
    //change time for screen 1
    [UIView animateWithDuration:1.5
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [imageView setFrame:frame];
                     }
                     completion:^(BOOL finished){
                         [imageView removeFromSuperview];
                         
                     }];
    [imageView release];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
