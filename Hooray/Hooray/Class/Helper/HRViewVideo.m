//
//  HRViewVideo.m
//  Hooray
//
//  Created by cncsoft on 4/11/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRViewVideo.h"

@implementation HRViewVideo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [_videoNameLabel release];
    [super dealloc];
}
@end
