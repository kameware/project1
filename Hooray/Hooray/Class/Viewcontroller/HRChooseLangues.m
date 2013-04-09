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
    _langugueLabel.font=[UIFont fontWithName:@"junegull" size:18];
    _langugueLabel.text = NSLocalizedString(@"LANGUAGE", nil);
    
    _nameAppLabel.text=NSLocalizedString(@"ANIMALHOORAY", nil);
    _nameAppLabel.font=[UIFont fontWithName:@"junegull" size:28];
    _nameAppLabel.strokeColor=[UIColor whiteColor];
    _nameAppLabel.strokeSize=2;
    [_nameAppLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
	[_nameAppLabel setShadowOffset:CGSizeMake(0.0f, 0.0)];
	[_nameAppLabel setShadowBlur:15];
    
    _selectLangLabel.text=NSLocalizedString(@"select the language..", nil);
    [_goBtn setTextbutton:NSLocalizedString(@"GO", nil)];
    _goBtn.titleOutlet.font=[UIFont boldSystemFontOfSize:17];
    _goBtn.titleOutlet.textColor=[UIColor whiteColor];
    _goBtn.titleOutlet.strokeColor=[UIColor colorWithRed:0.0 green:153/255.0 blue:64/255.0 alpha:1];
    _goBtn.titleOutlet.strokeSize=1;
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
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLangugueLabel:nil];
    [self setNameAppLabel:nil];
    [self setGoBtn:nil];
    [self setSelectLangLabel:nil];
    [super viewDidUnload];
}
#pragma mark-action
- (IBAction)goPress:(id)sender {
    HRChooseVersion *hRChooseVersion=[[[HRChooseVersion alloc] initWithNibName:@"HRChooseVersion" bundle:nil] autorelease];
    [self.navigationController pushViewController:hRChooseVersion animated:YES];
}
@end
