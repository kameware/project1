//
//  HRvideoCategory.m
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRvideoCategory.h"
#import "HRVideoPlay.h"
#import "HRAppDelegate.h"
@interface HRvideoCategory ()

@end

@implementation HRvideoCategory

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
    [_videoBtn1 setTextbutton:AMLocalizedString(@"VIDEO 1", nil)];
    [_videoBtn2 setTextbutton:AMLocalizedString(@"VIDEO 2", nil)];
    [_videoBtn3 setTextbutton:AMLocalizedString(@"VIDEO 3", nil)];
    [_videoBtn4 setTextbutton:AMLocalizedString(@"VIDEO 4", nil)];
    [_videoBtn5 setTextbutton:AMLocalizedString(@"VIDEO 5", nil)];
    
    if ([[HRAppDelegate shareAppDelegate] IAPItemPurchased]) {
        _videoBtn1.enabled=YES;
        _videoBtn2.enabled=YES;
        _videoBtn3.enabled=YES;
        _videoBtn4.enabled=YES;
        _videoBtn5.enabled=YES;
        
    }else{
        _videoBtn1.enabled=YES;
        _videoBtn2.enabled=NO;
        _videoBtn3.enabled=NO;
        _videoBtn4.enabled=NO;
        _videoBtn5.enabled=NO;
    }
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return NO;
}
- (BOOL)shouldAutorotate {
    
    return NO;
}
-(NSInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_videoBtn1 release];
    [_videoBtn2 release];
    [_videoBtn3 release];
    [_videoBtn4 release];
    [_videoBtn5 release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setVideoBtn1:nil];
    [self setVideoBtn2:nil];
    [self setVideoBtn3:nil];
    [self setVideoBtn4:nil];
    [self setVideoBtn5:nil];
    [super viewDidUnload];
}
#pragma mark-action
- (IBAction)videoPress:(id)sender {
    
    HRVideoPlay *hRVideoPlay=[[[HRVideoPlay alloc] initWithNibName:@"HRVideoPlay" bundle:nil] autorelease];
    hRVideoPlay.videoNumber=[sender tag];
    [self presentModalViewController:hRVideoPlay animated:YES];
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
