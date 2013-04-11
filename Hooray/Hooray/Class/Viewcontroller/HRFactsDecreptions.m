//
//  HRFactsDecreptions.m
//  Hooray
//
//  Created by luan on 4/10/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRFactsDecreptions.h"
#import "HRAppDelegate.h"
@interface HRFactsDecreptions ()
{
    NSMutableArray *listfacts;
    NSInteger currentFactNum;
}
@end

@implementation HRFactsDecreptions
@synthesize theAnimal;
@synthesize AnimalPlayer;

- (AVAudioPlayer *)loadMp3:(NSString *)filename {
    NSURL * url = [[NSBundle mainBundle] URLForResource:filename withExtension:@"mp3"];
    NSError * error;
    AVAudioPlayer * player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) {
        NSLog(@"Error loading %@: %@", url, error.localizedDescription);
    } else {
        [player prepareToPlay];
    }
    return player;
}
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
    //add long press image
    _imageAnimal.userInteractionEnabled=YES;
    _imageAnimal.clipsToBounds=YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0;
    [longPress setNumberOfTouchesRequired:1];
    [_imageAnimal addGestureRecognizer:longPress];
    [longPress release];
    //load audio
    AnimalPlayer =[self loadMp3:theAnimal];
    currentFactNum=0;
    NSLog(@"image name:%@",theAnimal);
    _nextLabel.text=AMLocalizedString(@"Next", nil);
    _backLabel.text=AMLocalizedString(@"Back", nil);
    _imageAnimal.image=[UIImage imageNamed:theAnimal];
    
    NSString *tempStr=[NSString stringWithFormat:@"%@_fact",theAnimal];
    
    NSString *factOfAnimal=AMLocalizedString(tempStr, nil);
    listfacts=[[NSMutableArray alloc] initWithArray:[factOfAnimal componentsSeparatedByString:@"\n"]];
    NSLog(@"num fact:%d",[listfacts count]);
    
    _factsTextField.text=[listfacts objectAtIndex:currentFactNum];
    _factsTextField.font=[UIFont fontWithName:@"junegull" size:25];
    
    _faceNumLabel.text=[NSString stringWithFormat:@"%@ %d",AMLocalizedString(@"Fact", nil),currentFactNum+1];
}
-(void)viewWillDisappear:(BOOL)animated{
    [AnimalPlayer stop];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageAnimal release];
    [_factsTextField release];
    [_backLabel release];
    [_nextLabel release];
    [_faceNumLabel release];
    [AnimalPlayer release];AnimalPlayer=nil;
    [super dealloc];
}
- (void)viewDidUnload {
    [self setImageAnimal:nil];
    [self setFactsTextField:nil];
    [self setBackLabel:nil];
    [self setNextLabel:nil];
    [self setFaceNumLabel:nil];
    [super viewDidUnload];
}
-  (void)handleLongPress:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
        
        //Do Whatever You want on End of Gesture
    }
    else if (sender.state == UIGestureRecognizerStateBegan){
        NSLog(@"UIGestureRecognizerStateBegan.");
        [AnimalPlayer play];
        //Do Whatever You want on Began of Gesture
    }
}
#pragma mark-action
- (IBAction)prePress:(id)sender {
    if (currentFactNum==0) {
        return;
    }
    currentFactNum--;
    _factsTextField.text=[listfacts objectAtIndex:currentFactNum];
    _faceNumLabel.text=[NSString stringWithFormat:@"%@ %d",AMLocalizedString(@"Fact", nil),currentFactNum+1];
    
}
- (IBAction)nextPress:(id)sender {
    
    if (currentFactNum>=9) {
        return;
    }
    currentFactNum++;
    _factsTextField.text=[listfacts objectAtIndex:currentFactNum];
    _faceNumLabel.text=[NSString stringWithFormat:@"%@ %d",AMLocalizedString(@"Fact", nil),currentFactNum+1];
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
