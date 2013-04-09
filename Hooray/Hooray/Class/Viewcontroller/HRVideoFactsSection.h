//
//  HRVideoFactsSection.h
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRmyButton.h"
@interface HRVideoFactsSection : UIViewController
@property (retain, nonatomic) IBOutlet HRmyButton *videoBtn;
@property (retain, nonatomic) IBOutlet HRmyButton *factsBtn;

- (IBAction)videoPress:(id)sender;
- (IBAction)factsPress:(id)sender;
- (IBAction)backPress:(id)sender;
@end
