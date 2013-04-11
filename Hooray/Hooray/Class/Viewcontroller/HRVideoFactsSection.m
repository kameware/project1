//
//  HRVideoFactsSection.m
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRVideoFactsSection.h"
#import "HRAppDelegate.h"
#import "HRvideoCategory.h"
#import "HRFactsCategory.h"
@interface HRVideoFactsSection ()

@end

@implementation HRVideoFactsSection

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
    [_videoBtn setTextbutton:AMLocalizedString(@"VIDEO SECTION", nil)];
    [_factsBtn setTextbutton:AMLocalizedString(@"FACTS SECTION", nil)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_videoBtn release];
    [_factsBtn release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setVideoBtn:nil];
    [self setFactsBtn:nil];
    [super viewDidUnload];
}
#pragma mark-action
- (IBAction)videoPress:(id)sender {
    
    HRvideoCategory *hRvideoCategory=[[[HRvideoCategory alloc] initWithNibName:@"HRvideoCategory" bundle:nil] autorelease];
    [self.navigationController pushViewController:hRvideoCategory animated:YES];
}

- (IBAction)factsPress:(id)sender {
    HRFactsCategory *hRFactsCategory=[[[HRFactsCategory alloc] initWithNibName:@"HRFactsCategory" bundle:nil] autorelease];
    [self.navigationController pushViewController:hRFactsCategory animated:YES];
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
