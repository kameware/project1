//
//  HRChooseLangues.m
//  Hooray
//
//  Created by luan on 4/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRChooseLangues.h"
#import "HRAppDelegate.h"
#import "HRChooseVersion.h"
#import "UIAlertView+error.h"
@interface HRChooseLangues ()

@end

@implementation HRChooseLangues

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
- (BOOL)shouldAutorotate {
    
    return NO;
}
-(NSInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUptext];
}
-(void)setUptext{
    _langugueLabel.font=[UIFont fontWithName:@"junegull" size:18];
    _langugueLabel.text = AMLocalizedString(@"LANGUAGE", nil);
    
    _nameAppLabel.text=AMLocalizedString(@"ANIMALHOORAY", nil);
    _nameAppLabel.font=[UIFont fontWithName:@"junegull" size:28];
    _nameAppLabel.strokeColor=[UIColor whiteColor];
    _nameAppLabel.strokeSize=2;
    [_nameAppLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
	[_nameAppLabel setShadowOffset:CGSizeMake(0.0f, 0.0)];
	[_nameAppLabel setShadowBlur:15];
    
    _selectLangLabel.text=AMLocalizedString(@"select the language..", nil);
    [_goBtn setTextbutton:AMLocalizedString(@"GO", nil)];
    _goBtn.titleOutlet.font=[UIFont boldSystemFontOfSize:17];
    _goBtn.titleOutlet.textColor=[UIColor whiteColor];
    _goBtn.titleOutlet.strokeColor=[UIColor colorWithRed:0.0 green:153/255.0 blue:64/255.0 alpha:1];
    _goBtn.titleOutlet.strokeSize=1;
    
    //set title for popup view
    for (HRmyButton *btn in _btnLang) {
        NSString *titleButton=[NSString stringWithFormat:@"LANG_%d",btn.tag];
        [btn setTextbutton:AMLocalizedString(titleButton, nil)];
        btn.titleOutlet.font=[UIFont boldSystemFontOfSize:14];
    }

}
-(void)viewWillAppear:(BOOL)animated{
    // check if we are selected language go to screen 3
    if ( [[[NSUserDefaults standardUserDefaults] objectForKey:@"chooseLanguage"] isEqualToString:@"YES"]) {
        [self goPress:nil];
    };
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_langugueLabel release];
    [_nameAppLabel release];
    [_goBtn release];
    [_selectLangLabel release];
    [_popupView release];
    [_btnLang release];
    [_selectLanguageLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLangugueLabel:nil];
    [self setNameAppLabel:nil];
    [self setGoBtn:nil];
    [self setSelectLangLabel:nil];
    [self setPopupView:nil];
    [self setBtnLang:nil];
    [self setSelectLanguageLabel:nil];
    [super viewDidUnload];
}
#pragma mark-action
- (IBAction)goPress:(id)sender {
    
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"chooseLanguage"] isEqualToString:@"YES"]) {
        [UIAlertView error:@"Please choose a language!"];
        return;
    }
    HRChooseVersion *hRChooseVersion=[[[HRChooseVersion alloc] initWithNibName:@"HRChooseVersion" bundle:nil] autorelease];
    [self.navigationController pushViewController:hRChooseVersion animated:YES];
}

- (IBAction)selectLangPress:(id)sender {
    [self showpopup];
    
}

- (IBAction)chooseAlangPress:(id)sender {
    [self hidepopup];
    //set array 10 language you want, I copy english and arabic
    NSArray *arrLanguage=[[NSArray alloc] initWithObjects:@"en",@"ar",@"ru",@"ar",@"en",@"ar",@"en",@"ar",@"en",@"ar",  nil];
    [[LocalizationSystem sharedLocalSystem] setLanguage:[arrLanguage objectAtIndex:[sender tag]-1]];
    NSString *theLanguage=[NSString stringWithFormat:@"LANG_%d",[sender tag]];
    _selectLanguageLabel.text=AMLocalizedString(theLanguage, nil);
    
   // set standardUserDefaults to mark selected language
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"chooseLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //reload text for language
    [self setUptext];
}
#pragma mark-popup
-(void)showpopup{
    [self.view addSubview:_popupView];
    _popupView.alpha=0;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         _popupView.alpha=1;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}
-(void)hidepopup{
    [self.view addSubview:_popupView];
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         _popupView.alpha=0;
                     }
                     completion:^(BOOL finished){
                         [_popupView removeFromSuperview];
                     }];
}
@end
