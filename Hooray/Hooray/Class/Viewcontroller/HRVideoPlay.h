//
//  HRVideoPlay.h
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h> 
@interface HRVideoPlay : UIViewController
@property(nonatomic,retain) MPMoviePlayerController *moviePlayerController;
- (IBAction)backPress:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *portraitView;
@property (retain, nonatomic) IBOutlet UIView *ladscapeView;
@end
