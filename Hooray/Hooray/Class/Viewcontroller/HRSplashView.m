//
//  HRSplashView.m
//  Hooray
//
//  Created by luan on 4/12/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRSplashView.h"

@interface HRSplashView ()

@end

@implementation HRSplashView

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
    //set name app text
    _nameAppLabel.text=AMLocalizedString(@"ANIMALHOORAY", nil);
    _nameAppLabel.font=[UIFont fontWithName:@"junegull" size:28];
    _nameAppLabel.strokeColor=[UIColor whiteColor];
    _nameAppLabel.strokeSize=2;
    [_nameAppLabel setShadowColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
	[_nameAppLabel setShadowOffset:CGSizeMake(0.0f, 0.0)];
	[_nameAppLabel setShadowBlur:15];
    //sett animal text
    _animalLabel.text=AMLocalizedString(@"ANIMAL", nil);
    _animalLabel.font=[UIFont fontWithName:@"junegull" size:40];
    _animalLabel.strokeColor=[UIColor greenColor];
    _animalLabel.strokeSize=1;
    _animalLabel.gradientStartColor=[UIColor colorWithRed:59/225.0 green:245/255.0 blue:67/255.0 alpha:1];
    _animalLabel.gradientEndColor=[UIColor colorWithRed:15/225.0 green:113/255.0 blue:56/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_nameAppLabel release];
    [_animalLabel release];
    [_hoorayLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setNameAppLabel:nil];
    [self setAnimalLabel:nil];
    [self setHoorayLabel:nil];
    [super viewDidUnload];
}
@end
