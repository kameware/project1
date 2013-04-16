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
#import "LocalizationSystem.h"
@interface HRChooseLangues : UIViewController

@property (retain, nonatomic) IBOutlet THLabel *langugueLabel;
@property (retain, nonatomic) IBOutlet THLabel *nameAppLabel;
@property (retain, nonatomic) IBOutlet HRmyButton *goBtn;
@property (retain, nonatomic) IBOutlet UILabel *selectLangLabel;
@property (retain, nonatomic) IBOutlet UIView *popupView;
@property (retain, nonatomic) IBOutlet UILabel *selectLanguageLabel;
@property (retain, nonatomic) IBOutletCollection(HRmyButton) NSArray *btnLang;
- (IBAction)chooseAlangPress:(id)sender;
@end
