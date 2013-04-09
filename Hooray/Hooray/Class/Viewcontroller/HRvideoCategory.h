//
//  HRvideoCategory.h
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRmyButton.h"
@interface HRvideoCategory : UIViewController

@property (retain, nonatomic) IBOutlet HRmyButton *videoBtn1;
@property (retain, nonatomic) IBOutlet HRmyButton *videoBtn2;
@property (retain, nonatomic) IBOutlet HRmyButton *videoBtn3;
@property (retain, nonatomic) IBOutlet HRmyButton *videoBtn4;
@property (retain, nonatomic) IBOutlet HRmyButton *videoBtn5;


- (IBAction)videoPress:(id)sender;
- (IBAction)backPress:(id)sender;
@end
