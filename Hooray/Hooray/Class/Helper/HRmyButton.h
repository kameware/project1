//
//  HRmyButton.h
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THLabel.h"
@interface HRmyButton : UIButton
@property(nonatomic,retain) THLabel *titleOutlet;
-(void)setTextbutton:(NSString*)text;
@end
