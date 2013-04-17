//
//  HRFactsCategory.m
//  Hooray
//
//  Created by luan on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "HRFactsCategory.h"
#import "HRAppDelegate.h"
#import "HRFactsDecreptions.h"
#import "LocalizationSystem.h"
@interface HRFactsCategory ()
{
}
@end

@implementation HRFactsCategory
@synthesize listAnimals;
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
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    NSString *filePath = [cacheDirectory stringByAppendingString:@"/Animal.plist"];

    //get all animal from plits file
    listAnimals=[[NSMutableArray alloc] initWithContentsOfFile:filePath];
    allKey=[[NSMutableArray alloc] init];
    allSection=[[NSMutableDictionary alloc] init];
    //get index A-Z
    NSLog(@"current lang:%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]);
    BOOL found;
    for (NSString *theAnimal in listAnimals) {
        NSString *c = [[theAnimal substringToIndex:1] uppercaseString];
        found=NO;
        for (NSString *str in allKey)
        {
            if ([str isEqualToString:c])
            {
                found=YES;
            }
            
        }
        
        if (!found) {
            [allKey addObject:c];
        }
    }
   //store in section
    for (NSString * aLetter in allKey) {
        NSPredicate *filter=[NSPredicate predicateWithFormat:@"SELF BEGINSWITH[c] %@",aLetter];
        NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: YES];
        NSArray *asection=[[listAnimals filteredArrayUsingPredicate:filter] sortedArrayUsingDescriptors:[NSArray arrayWithObject: sortOrder]];;
        [allSection setObject:asection forKey:aLetter];
    }
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
    
    return [allKey count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {    
    return [[allSection objectForKey:[allKey objectAtIndex:section]] count];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *aView = [[UIView alloc] initWithFrame:CGRectZero];
    aView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgHeader"]];
    THLabel *labelTitle = [[THLabel alloc] init];
    NSString *headerText=@" ";
    headerText=[headerText stringByAppendingString:[allKey objectAtIndex:section]];
    labelTitle.text =headerText ;
//    labelTitle.textAlignment=UITextAlignmentLeft;
    labelTitle.font = [UIFont boldSystemFontOfSize:20];
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.backgroundColor = [UIColor clearColor];
    [labelTitle setFrame:CGRectMake(3, 0, 298, 30)];
    labelTitle.strokeColor=[UIColor colorWithRed:10/255.0 green:111/255.0 blue:55/255.0 alpha:1];
    labelTitle.strokeSize=2;
    [aView addSubview:labelTitle];
    [labelTitle release];
    return [aView autorelease];
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
        //add dot right of animal name
        NSString *nameAnimal=@"• ";
        nameAnimal=[nameAnimal stringByAppendingString:[[allSection objectForKey:[allKey objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
        if (![[[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0] isEqualToString:@"en"]) {
            NSString *animalforLang=AMLocalizedString([[allSection objectForKey:[allKey objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row],nil);
            nameAnimal=[nameAnimal stringByAppendingFormat:@"(%@)",animalforLang];
        }
        cell.textLabel.text=nameAnimal;
        cell.textLabel.textColor=[UIColor colorWithRed:10/255.0 green:111/255.0 blue:55/255.0 alpha:1];
        cell.textLabel.font=[UIFont fontWithName:@"junegull" size:20];
        //check if free version we only 10 animal click.
        int sum=0;
        for (int i=0; i<indexPath.section; i++) {
            sum+=[_tableVIew numberOfRowsInSection:i];
            
        }
        sum+=indexPath.row;
        if (![[HRAppDelegate shareAppDelegate] IAPItemPurchased]&&(sum>=10)) {
            cell.userInteractionEnabled=NO;
            cell.textLabel.textColor=[UIColor grayColor];
        }
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
    HRFactsDecreptions *hRFactsDecreptions=[[[HRFactsDecreptions alloc] initWithNibName:@"HRFactsDecreptions" bundle:nil] autorelease];
    hRFactsDecreptions.theAnimal=[[allSection objectForKey:[allKey objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    NSLog(@"the animal chose:%@",hRFactsDecreptions.theAnimal);
    [self.navigationController pushViewController:hRFactsDecreptions animated:YES];
    
}

- (IBAction)backPress:(id)sender {
    
    [self.navigationController popViewControllerAnimated: YES];
}
@end
