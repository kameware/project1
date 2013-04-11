//
//  HRChooseVersion.m
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRChooseVersion.h"
#import "HRAppDelegate.h"
#import "HRVideoFactsSection.h"
@interface HRChooseVersion ()

@end

@implementation HRChooseVersion

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ([[HRAppDelegate shareAppDelegate] isTall]) {
        self = [super initWithNibName:[nibNameOrNil stringByAppendingString:@"_iphone5"] bundle:nibBundleOrNil];
    }
    else{
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    }
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _nameAppLabel.text=AMLocalizedString(@"ANIMALHOORAY", nil);
    _nameAppLabel.font=[UIFont fontWithName:@"junegull" size:28];
    _nameAppLabel.strokeColor=[UIColor whiteColor];
    _nameAppLabel.strokeSize=2;
    [_nameAppLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
	[_nameAppLabel setShadowOffset:CGSizeMake(0.0f, 0.0)];
	[_nameAppLabel setShadowBlur:15];
    
    [_freeVerBtn setTextbutton:AMLocalizedString(@"FREE VERSION", nil)];
    [_fullVerBtn setTextbutton:AMLocalizedString(@"FULL VERSION", nil)];
    _aboutAppTextView.text=AMLocalizedString(@"ABOUT", nil);
    // if langguage is selected -> hidden back button
    if ( [[[NSUserDefaults standardUserDefaults] objectForKey:@"chooseLanguage"] isEqualToString:@"YES"]) {
        _backBtn.hidden=YES;
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    [_nameAppLabel release];
    [_freeVerBtn release];
    [_fullVerBtn release];
    [_aboutAppTextView release];
    [_backBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNameAppLabel:nil];
    [self setFreeVerBtn:nil];
    [self setFullVerBtn:nil];
    [self setAboutAppTextView:nil];
    [self setBackBtn:nil];
    [super viewDidUnload];
}
#pragma mark-action
- (IBAction)freeVerPress:(id)sender {
    HRVideoFactsSection *hRVideoFactsSection=[[[HRVideoFactsSection alloc] initWithNibName:@"HRVideoFactsSection" bundle:nil] autorelease];
    [self.navigationController pushViewController:hRVideoFactsSection animated:YES];
}

- (IBAction)fullVerPress:(id)sender {
//    HRVideoFactsSection *hRVideoFactsSection=[[[HRVideoFactsSection alloc] initWithNibName:@"HRVideoFactsSection" bundle:nil] autorelease];
//    [self.navigationController pushViewController:hRVideoFactsSection animated:YES];
    if ([self IAPItemPurchased]) {
        
    }
    else
    {
        loadingIcon=[[MBProgressHUD alloc] initWithView:self.view];
        loadingIcon.labelText=@"please wait...";
        [self.view addSubview:loadingIcon];
        [loadingIcon show:YES];
        [self IAPItemPurchase];
        return;
    }
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark
#pragma mark check IAPItemPurchased
-(void)IAPItemPurchase
{
    UIAlertView  *askToPurchase = [[UIAlertView alloc]
                                   initWithTitle:@"Hooray"
                                   message:@"Do you want to buy full version ?"
                                   delegate:self
                                   cancelButtonTitle:nil
                                   otherButtonTitles:@"Yes", @"No", nil];
    
    askToPurchase.delegate = self;
    askToPurchase.tag=1234;
    [askToPurchase show];
    
    [askToPurchase release];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    
    if (alertView.tag==1234) {
        
        if (buttonIndex==0) {
            if ([SKPaymentQueue canMakePayments]) {
                [[MKStoreManager sharedManager] buyFeature:@"kItemId"];
                [MKStoreManager setDelegate:self];
            } else {
                UIAlertView *tmp = [[UIAlertView alloc]
                                    initWithTitle:@"Prohibited"
                                    message:@"Parental Control is enabled, cannot make a purchase!"
                                    delegate:self
                                    cancelButtonTitle:nil
                                    otherButtonTitles:@"Ok", nil];
                
                [tmp show];
                [tmp release];
                
            }
            
        }
        
    }
    
    
    
}
-(void)productFetchComplete{
    NSLog(@"connect succes itune");
    [loadingIcon hide:YES];
}

-(void)productPurchased:(NSString *)productId{
    
    NSLog(@"succes -> purchase %@",productId);
    if ([productId isEqualToString:@"kItemId"]) {
        NSError *error = nil;
        [SFHFKeychainUtils storeUsername:@"IAPluannguyen" andPassword:@"luanchi" forServiceName:kStoredData updateExisting:YES error:&error];
        UIAlertView *tmp = [[UIAlertView alloc]
                            initWithTitle:@"Hooray"
                            message:@"Great!"
                            delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
        [tmp show];
        [tmp release];
    }
}
-(void)transactionCanceled{
    NSLog(@"transactionCanceled - failed");
    
    [loadingIcon hide:YES];
    //    TAlertView *alert = [[TAlertView alloc]initType1WithTitle:@"" andMessage:@"Purchase failed, please try again later!" andDelegate:nil andOptionTitle:@"OK"];
    
}
-(BOOL)IAPItemPurchased {
    NSError *error = nil;
    NSString *password = [SFHFKeychainUtils getPasswordForUsername:@"IAPluannguyen" andServiceName:kStoredData error:&error];
    if ([password isEqualToString:@"luanchi"]) return YES; else return NO;
}

@end
