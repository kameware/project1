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

}
-(void)viewWillAppear:(BOOL)animated{
        [self setUptext];
}
-(void)setUptext{
    
    _langugueLabel.font=[UIFont fontWithName:@"junegull" size:25];
    _langugueLabel.text = AMLocalizedString(@"LANGUAGE", nil);
    
    _nameAppLabel.text=AMLocalizedString(@"ANIMALHOORAY", nil);
    _nameAppLabel.font=[UIFont fontWithName:@"junegull" size:35];
    _nameAppLabel.strokeColor=[UIColor whiteColor];
    _nameAppLabel.strokeSize=2;
    [_nameAppLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
	[_nameAppLabel setShadowOffset:CGSizeMake(0.0f, 0.0)];
	[_nameAppLabel setShadowBlur:15];
    
    //set title for popup view
    for (HRmyButton *btn in _btnLang) {
        btn.titleOutlet.text=@"";
        NSString *titleButton=[NSString stringWithFormat:@"LANG_%d",btn.tag];
        [btn setTextbutton:AMLocalizedString(titleButton, nil)];
        btn.titleOutlet.font=[UIFont boldSystemFontOfSize:14];
        btn.titleOutlet.alpha=0.8;
        btn.titleOutlet.strokeColor=[UIColor clearColor];
    }
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

- (IBAction)chooseAlangPress:(id)sender {
    //set array 10 language you want, I copy english and arabic
    NSArray *arrLanguage=[[NSArray alloc] initWithObjects:@"en",@"ar",@"en",@"ar",@"en",@"ar",@"en",@"ar",@"en",@"ar",  nil];
    [[LocalizationSystem sharedLocalSystem] setLanguage:[arrLanguage objectAtIndex:[sender tag]-1]];
    [arrLanguage release];
    NSString *theLanguage=[NSString stringWithFormat:@"LANG_%d",[sender tag]];
    _selectLanguageLabel.text=AMLocalizedString(theLanguage, nil);
    //goto choose version
    HRChooseVersion *hRChooseVersion=[[[HRChooseVersion alloc] initWithNibName:@"HRChooseVersion" bundle:nil] autorelease];
    [self.navigationController pushViewController:hRChooseVersion animated:YES];

}
@end
