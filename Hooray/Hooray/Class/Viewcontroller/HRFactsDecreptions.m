//
//  HRFactsDecreptions.m
//  Hooray
//
//  Created by luan on 4/10/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRFactsDecreptions.h"

@interface HRFactsDecreptions ()
{
    NSMutableArray *listfacts;
    NSInteger currentFactNum;
}
@end

@implementation HRFactsDecreptions
@synthesize theAnimal;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentFactNum=0;
    NSLog(@"image name:%@",theAnimal);
    _nextLabel.text=NSLocalizedString(@"Next", nil);
    _backLabel.text=NSLocalizedString(@"Back", nil);
    _imageAnimal.image=[UIImage imageNamed:theAnimal];
    
    NSString *tempStr=[NSString stringWithFormat:@"%@_fact",theAnimal];
    
    NSString *factOfAnimal=NSLocalizedString(tempStr, nil);
    listfacts=[[NSMutableArray alloc] initWithArray:[factOfAnimal componentsSeparatedByString:@"\n"]];
    NSLog(@"num fact:%d",[listfacts count]);
    
    _factsTextField.text=[listfacts objectAtIndex:currentFactNum];
    _factsTextField.font=[UIFont fontWithName:@"junegull" size:25];
    
    _faceNumLabel.text=[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"Fact", nil),currentFactNum+1];
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
- (IBAction)prePress:(id)sender {
    if (currentFactNum==0) {
        return;
    }
    currentFactNum--;
    _factsTextField.text=[listfacts objectAtIndex:currentFactNum];
    _faceNumLabel.text=[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"Fact", nil),currentFactNum+1];
    
}
- (IBAction)nextPress:(id)sender {
    
    if (currentFactNum>=9) {
        return;
    }
    currentFactNum++;
    _factsTextField.text=[listfacts objectAtIndex:currentFactNum];
    _faceNumLabel.text=[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"Fact", nil),currentFactNum+1];
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
