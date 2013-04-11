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
#import <StoreKit/StoreKit.h>
#import "MKStoreManager.h"
#import "SFHFKeychainUtils.h"
#import "MBProgressHUD.h"
#define kStoredData @"com.cncmobilegroup.AppForTestIAP" //replace your bundle id
#define kItemId @"Item_1" //replace your in-app purchase id
@interface HRChooseVersion : UIViewController
{
    MBProgressHUD *loadingIcon;
}
@property (retain, nonatomic) IBOutlet THLabel *nameAppLabel;
@property (retain, nonatomic) IBOutlet HRmyButton *freeVerBtn;
@property (retain, nonatomic) IBOutlet HRmyButton *fullVerBtn;
@property (retain, nonatomic) IBOutlet UIButton *backBtn;
@property (retain, nonatomic) IBOutlet UITextView *aboutAppTextView;
- (IBAction)freeVerPress:(id)sender;
- (IBAction)fullVerPress:(id)sender;
- (IBAction)backPress:(id)sender;
@end
