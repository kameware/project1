//
//  UIAlertView+error.m
//  iReporter
//
//  Created by Marin Todorov on 09/02/2012.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "UIAlertView+error.h"

@implementation UIAlertView(error)
+(void)error:(NSString*)msg
{
   UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Hooray"
                                message:msg 
                               delegate:nil 
                      cancelButtonTitle:@"OK" 
                      otherButtonTitles: nil];
    [alert show];
    [alert release];
}
@end
