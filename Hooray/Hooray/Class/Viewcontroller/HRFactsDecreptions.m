//
//  HRFactsDecreptions.m
//  Hooray
//
//  Created by luan on 4/10/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRFactsDecreptions.h"

@interface HRFactsDecreptions ()

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
    // Do any additional setup after loading the view from its nib.
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
    [super dealloc];
}
- (void)viewDidUnload {
    [self setImageAnimal:nil];
    [self setFactsTextField:nil];
    [self setBackLabel:nil];
    [self setNextLabel:nil];
    [super viewDidUnload];
}
- (IBAction)prePress:(id)sender {
}
- (IBAction)nextPress:(id)sender {
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
