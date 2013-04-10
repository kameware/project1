//
//  HRFactsDecreptions.h
//  Hooray
//
//  Created by luan on 4/10/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRFactsDecreptions : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageAnimal;
@property (retain, nonatomic) IBOutlet UITextView *factsTextField;
@property (retain, nonatomic) IBOutlet UILabel *backLabel;
@property (retain, nonatomic) IBOutlet UILabel *nextLabel;
@property (retain, nonatomic) NSString *theAnimal;
- (IBAction)prePress:(id)sender;
- (IBAction)nextPress:(id)sender;
- (IBAction)backPress:(id)sender;
@end
