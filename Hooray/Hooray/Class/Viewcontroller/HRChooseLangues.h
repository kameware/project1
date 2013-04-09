//
//  HRChooseLangues.h
//  Hooray
//
//  Created by luan on 4/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRmyButton.h"
#import "THLabel.h"
@interface HRChooseLangues : UIViewController

@property (retain, nonatomic) IBOutlet THLabel *langugueLabel;
@property (retain, nonatomic) IBOutlet THLabel *nameAppLabel;
@property (retain, nonatomic) IBOutlet HRmyButton *goBtn;
@property (retain, nonatomic) IBOutlet UILabel *selectLangLabel;
- (IBAction)goPress:(id)sender;
@end
