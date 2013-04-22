//
//  HRmyButton.m
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRmyButton.h"

@implementation HRmyButton
@synthesize titleOutlet;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }

    return self;
}
-(void)setTextbutton:(NSString*)text{
    CGRect frame=self.frame;
    for (UIView *view in [self subviews]) {
        if ([view isKindOfClass:[THLabel class]]) {
            [view removeFromSuperview];
        }
    }
    frame.origin=CGPointMake(0, 0);
    self.titleOutlet=[[THLabel alloc] initWithFrame:frame];
    [self addSubview:self.titleOutlet];
    self.titleOutlet.textAlignment=UITextAlignmentCenter;
    titleOutlet.text=text;
    titleOutlet.textColor=[UIColor whiteColor];
    titleOutlet.font=[UIFont boldSystemFontOfSize:17];
}
-(void)dealloc{
    
    [titleOutlet release];
    [super dealloc];
}

@end
