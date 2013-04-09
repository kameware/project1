//
//  HRChooseVersion.h
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//
#import "THLabel.h"
#import "HRmyButton.h"
#import <UIKit/UIKit.h>

@interface HRChooseVersion : UIViewController

@property (retain, nonatomic) IBOutlet THLabel *nameAppLabel;
@property (retain, nonatomic) IBOutlet HRmyButton *freeVerBtn;
@property (retain, nonatomic) IBOutlet HRmyButton *fullVerBtn;
@property (retain, nonatomic) IBOutlet UITextView *aboutAppTextView;
- (IBAction)freeVerPress:(id)sender;
- (IBAction)fullVerPress:(id)sender;
- (IBAction)backPress:(id)sender;
@end
