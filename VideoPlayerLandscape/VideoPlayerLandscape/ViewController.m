//
//  ViewController.m
//  VideoPlayerLandscape
//
//  Created by Julio Rivas on 24/2/15.
//  Copyright (c) 2015 LuaLabs Inc. All rights reserved.
//

#import "ViewController.h"
#import "PlayerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playVideo:(id)sender {
    
    PlayerViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([PlayerViewController class])];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
