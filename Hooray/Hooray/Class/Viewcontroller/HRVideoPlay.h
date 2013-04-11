//
//  HRVideoPlay.h
//  Hooray
//
//  Created by cncsoft on 4/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h> 
#import "HRViewVideo.h"
@interface HRVideoPlay : UIViewController
@property(nonatomic,retain) MPMoviePlayerController *moviePlayerController;
- (IBAction)backPress:(id)sender;
@property (retain, nonatomic) IBOutlet HRViewVideo *portraitView;
@property (retain, nonatomic) IBOutlet HRViewVideo *ladscapeView;
@property (assign, nonatomic) NSInteger videoNumber;
@end
