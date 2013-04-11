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
{
    BOOL isportraitmode;
}
@end

@implementation HRVideoPlay
@synthesize moviePlayerController;
@synthesize videoNumber;
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
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if(UIInterfaceOrientationIsLandscape(interfaceOrientation)){
		self.ladscapeView.hidden=NO;
        [self setframeForLadscape];
        isportraitmode=NO;
	} else {
		self.ladscapeView.hidden=YES;
        [self setframeForPortrait];
        isportraitmode=YES;
	}
	return YES;
}
- (BOOL)shouldAutorotate {
    
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    if(UIInterfaceOrientationIsLandscape(orientation)){
		self.ladscapeView.hidden=NO;
        isportraitmode=NO;
        [self setframeForLadscape];
	} else {
		self.ladscapeView.hidden=YES;
        isportraitmode=YES;
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
        isportraitmode=NO;
	} else {
		self.ladscapeView.hidden=YES;
        [self setframeForPortrait];
        isportraitmode=YES;
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
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"video%d",videoNumber] ofType:@"m4v"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
//    [moviePlayerController.view setFrame:CGRectMake(38, 93, 246.5, 212)];
    _portraitView.videoNameLabel.text=[NSString stringWithFormat:@"video%d",videoNumber];
     _ladscapeView.videoNameLabel.text=[NSString stringWithFormat:@"video%d",videoNumber];
    if (isportraitmode) {
        [self setframeForPortrait];
    }else{
        [self setframeForLadscape];
    }
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
       [moviePlayerController.view setFrame:CGRectMake(38, 93, 246.5, 212)];         
    }else{
       [moviePlayerController.view setFrame:CGRectMake(38, 93, 246.5, 212)]; 
    }
}
-(void)setframeForLadscape
{
    if (![[HRAppDelegate shareAppDelegate] isTall]) {
     [moviePlayerController.view setFrame:CGRectMake(74.5, 64, 335, 209)];        
    }else{
     [moviePlayerController.view setFrame:CGRectMake(118.5, 64, 335, 209)];
    }
}
@end
