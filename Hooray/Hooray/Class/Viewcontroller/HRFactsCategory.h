//
//  HRFactsCategory.h
//  Hooray
//
//  Created by luan on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THLabel.h"
@interface HRFactsCategory : UIViewController
{
    NSMutableArray *allKey;
    NSMutableDictionary *allSection;
}
@property (retain, nonatomic) IBOutlet UITableView *tableVIew;
@property (retain, nonatomic) NSMutableArray *listAnimals;
- (IBAction)backPress:(id)sender;
@end
