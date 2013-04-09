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
    
    _nameAppLabel.text=NSLocalizedString(@"ANIMALHOORAY", nil);
    _nameAppLabel.font=[UIFont fontWithName:@"junegull" size:28];
    _nameAppLabel.strokeColor=[UIColor whiteColor];
    _nameAppLabel.strokeSize=2;
    [_nameAppLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
	[_nameAppLabel setShadowOffset:CGSizeMake(0.0f, 0.0)];
	[_nameAppLabel setShadowBlur:15];
    
    [_freeVerBtn setTextbutton:NSLocalizedString(@"FREE VERSION", nil)];
//    _freeVerBtn.titleOutlet .font=[UIFont boldSystemFontOfSize:15];
    [_fullVerBtn setTextbutton:NSLocalizedString(@"FULL VERSION", nil)];
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
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNameAppLabel:nil];
    [self setFreeVerBtn:nil];
    [self setFullVerBtn:nil];
    [self setAboutAppTextView:nil];
    [super viewDidUnload];
}
#pragma mark-action
- (IBAction)freeVerPress:(id)sender {
    HRVideoFactsSection *hRVideoFactsSection=[[[HRVideoFactsSection alloc] initWithNibName:@"HRVideoFactsSection" bundle:nil] autorelease];
    [self.navigationController pushViewController:hRVideoFactsSection animated:YES];
}

- (IBAction)fullVerPress:(id)sender {
    HRVideoFactsSection *hRVideoFactsSection=[[[HRVideoFactsSection alloc] initWithNibName:@"HRVideoFactsSection" bundle:nil] autorelease];
    [self.navigationController pushViewController:hRVideoFactsSection animated:YES];
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
