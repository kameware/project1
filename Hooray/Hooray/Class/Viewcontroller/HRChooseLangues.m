//
//  HRChooseLangues.m
//  Hooray
//
//  Created by luan on 4/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRChooseLangues.h"

@interface HRChooseLangues ()

@end

@implementation HRChooseLangues

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
    _langugueLabel.font=[UIFont fontWithName:@"junegull" size:18];
    _langugueLabel.text = NSLocalizedString(@"LANGUAGE", nil);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_langugueLabel release];
    [_nameAppLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLangugueLabel:nil];
    [self setNameAppLabel:nil];
    [super viewDidUnload];
}
@end
