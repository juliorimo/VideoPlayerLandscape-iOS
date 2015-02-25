//
//  PlayerViewController.m
//  VideoPlayerLandscape
//
//  Created by Julio Rivas on 25/2/15.
//  Copyright (c) 2015 LuaLabs Inc. All rights reserved.
//

#import "PlayerViewController.h"
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayerViewController ()

@end

@implementation PlayerViewController
{
    MPMoviePlayerController *_moviePlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self playVideo];
}

- (void)playVideo{

    NSURL *url = [NSURL URLWithString:
                  @"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"];
    _moviePlayer = [[MPMoviePlayerController alloc]
                                           initWithContentURL:url];
    _moviePlayer.view.frame = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width);
    
    [self.view addSubview:_moviePlayer.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_moviePlayer];
    
    // Hide the video controls from the user
    [_moviePlayer setControlStyle:MPMovieControlStyleFullscreen];
    [_moviePlayer prepareToPlay];
    [_moviePlayer play];
}

- (void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}


- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft|UIInterfaceOrientationMaskLandscapeRight;
}

@end
