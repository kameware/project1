//
//  HRVideoPlay.m
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRVideoPlay.h"
#import "HRAppDelegate.h"

@interface HRVideoPlay ()

@end

@implementation HRVideoPlay
@synthesize moviePlayerController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if(UIInterfaceOrientationIsLandscape(interfaceOrientation)){
		self.ladscapeView.hidden=NO;
        [self setframeForLadscape];
	} else {
		self.ladscapeView.hidden=YES;
        [self setframeForPortrait];
	}
	return YES;
}
- (BOOL)shouldAutorotate {
    
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    if(UIInterfaceOrientationIsLandscape(orientation)){
		self.ladscapeView.hidden=NO;
        [self setframeForLadscape];
	} else {
		self.ladscapeView.hidden=YES;
        [self setframeForPortrait];
	}
    
    return YES;
}

-(NSInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	if(UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])){
		self.ladscapeView.hidden=NO;
        [self setframeForLadscape];
	} else {
		self.ladscapeView.hidden=YES;
        [self setframeForPortrait];
	}
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:_portraitView];
    if ([[HRAppDelegate shareAppDelegate] isTall]) {
        _ladscapeView.frame=CGRectMake(0, 0, 320, 568);
    }
    else
        _ladscapeView.frame=CGRectMake(0, 0, 320, 480);
    [self.view addSubview:_ladscapeView];
    _ladscapeView.hidden=YES;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"big-buck-bunny-clip" ofType:@"m4v"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
//    [moviePlayerController.view setFrame:CGRectMake(38, 93, 246.5, 212)];
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.controlStyle=MPMovieControlStyleEmbedded;
    [moviePlayerController play];
}
-(void)viewWillDisappear:(BOOL)animated{
    [moviePlayerController stop];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [_portraitView release];
    [_ladscapeView release];
    [super dealloc];
    [moviePlayerController release];moviePlayerController=nil;
}
- (IBAction)backPress:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidUnload {
    [self setPortraitView:nil];
    [self setLadscapeView:nil];
    [super viewDidUnload];
}
#pragma mark-set frame moviePlayerController
-(void)setframeForPortrait
{
    if ([[HRAppDelegate shareAppDelegate] isTall]) {
        
    }else{
       [moviePlayerController.view setFrame:CGRectMake(38, 93, 246.5, 212)]; 
    }
}
-(void)setframeForLadscape
{
    if ([[HRAppDelegate shareAppDelegate] isTall]) {
        
    }else{
     [moviePlayerController.view setFrame:CGRectMake(75, 65, 335, 209)];
    }
}
@end
