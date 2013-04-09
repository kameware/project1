//
//  UINavigationController+RotationIn_IOS6.m
//  LinkDenity
//
//  Created by cncsoft on 4/2/13.
//  Copyright (c) 2013 cncsoft. All rights reserved.
//

#import "UINavigationController+RotationIn_IOS6.h"

@implementation UINavigationController (RotationIn_IOS6)
-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}
@end
