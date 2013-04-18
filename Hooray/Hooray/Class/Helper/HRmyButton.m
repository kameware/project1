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
    frame.origin=CGPointMake(0, 0);
    self.titleOutlet=[[THLabel alloc] initWithFrame:frame];
    [self addSubview:self.titleOutlet];
    self.titleOutlet.textAlignment=UITextAlignmentCenter;
    titleOutlet.text=text;
    titleOutlet.textColor=[UIColor whiteColor];
//    titleOutlet.strokeColor=[UIColor colorWithRed:0.0 green:153/255.0 blue:64/255.0 alpha:1];
//    titleOutlet.strokeSize=2;
    titleOutlet.font=[UIFont boldSystemFontOfSize:17];
}
-(void)dealloc{
    
    [titleOutlet release];
    [super dealloc];
}

@end
