//
//  HRFactsCategory.m
//  Hooray
//
//  Created by luan on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRFactsCategory.h"

@interface HRFactsCategory ()

@end

@implementation HRFactsCategory

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
    [_tableVIew release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableVIew:nil];
    [super viewDidUnload];
}
#pragma mark
#pragma table delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *aView = [[UIView alloc] initWithFrame:CGRectZero];
    aView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgHeader"]];
    THLabel *labelTitle = [[THLabel alloc] init];
    labelTitle.text = @" Sport";
    labelTitle.textAlignment=UITextAlignmentLeft;
    labelTitle.font = [UIFont boldSystemFontOfSize:22];
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setFrame:CGRectMake(10, 0, 298, 30)];
    labelTitle.strokeColor=[UIColor colorWithRed:10/255.0 green:111/255.0 blue:55/255.0 alpha:1];
    labelTitle.strokeSize=2;
    [aView addSubview:labelTitle];
    [labelTitle release];
    return [aView autorelease];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [_tableVIew dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] init] autorelease];
        cell.textLabel.text=@"Dog";
        cell.textLabel.textColor=[UIColor colorWithRed:10/255.0 green:111/255.0 blue:55/255.0 alpha:1];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 33;
}
#pragma mark
#pragma selected table
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
