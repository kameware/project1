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
@synthesize listAnimal;
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
    UITapGestureRecognizer *longPress = [[UITapGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
//    longPress.minimumPressDuration = 1.0;
    [longPress setNumberOfTouchesRequired:1];
    [_imageAnimal addGestureRecognizer:longPress];
    [longPress release];

    _factsTextField.font=[UIFont fontWithName:@"junegull" size:20];
}
-(void)viewWillAppear:(BOOL)animated{
    //load fact
       [_factsTextField addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
    _faceNumLabel.text=[NSString stringWithFormat:@"%@ %d",AMLocalizedString(@"Fact", nil),currentFactNum+1];
    _faceNumLabel.strokeColor=[UIColor whiteColor];
    _faceNumLabel.strokeSize=1;
    [_faceNumLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
	[_faceNumLabel setShadowOffset:CGSizeMake(0.0f, 0.0)];
	[_faceNumLabel setShadowBlur:15];
    [self initWithAnimal:theAnimal];
}
-(void)viewWillDisappear:(BOOL)animated{
    [AnimalPlayer stop];
[_factsTextField removeObserver:self forKeyPath:@"contentSize"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_imageAnimal release];
    [_factsTextField release];_factsTextField=nil;
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
#pragma mark- init animal
-(void)initWithAnimal:(NSString*)aAnimal{
    //load audio
    AnimalPlayer =[self loadMp3:aAnimal];
    currentFactNum=0;
    NSLog(@"image name:%@",aAnimal);
    NSString *tempStr=[NSString stringWithFormat:@"%@_fact",aAnimal];
    NSString *factOfAnimal=AMLocalizedString(tempStr, nil);
    listfacts=[[NSMutableArray alloc] initWithArray:[factOfAnimal componentsSeparatedByString:@"\n"]];
    [UIView transitionWithView: self.imageAnimal
                      duration: 0.35f
                       options: UIViewAnimationOptionTransitionCrossDissolve
                    animations: ^(void)
     {
         _imageAnimal.image=[UIImage imageNamed:aAnimal];
         _factsTextField.text=[listfacts objectAtIndex:currentFactNum];
         _faceNumLabel.text=[NSString stringWithFormat:@"%@ %d",AMLocalizedString(@"Fact", nil),currentFactNum+1];
     }
                    completion: ^(BOOL isFinished)
     {
         /* TODO: Whatever you want here */
         
     }];
}
#pragma mark- GestureRecognizer delegate
-  (void)handleLongPress:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"UIGestureRecognizerStateEnded");
         [AnimalPlayer play];
        //Do Whatever You want on End of Gesture
    }
    else if (sender.state == UIGestureRecognizerStateBegan){
        NSLog(@"UIGestureRecognizerStateBegan.");
       
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

- (IBAction)nextAnimalPress:(id)sender {
    [AnimalPlayer stop];
    int i=[listAnimal indexOfObject:theAnimal];
    i++;
    if (i==[listAnimal count]) {
        return;
    }
    theAnimal=[listAnimal objectAtIndex:i];
    [self initWithAnimal:theAnimal];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
        // This message is for me, do whatever I want with it.
        UITextView *tv = object;
        CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
        topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
        tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
}
@end
