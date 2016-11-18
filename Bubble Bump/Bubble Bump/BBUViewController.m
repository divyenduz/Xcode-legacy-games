//
//  BBUViewController.m
//  Bubble Bump
//
//  Created by Divyendu Singh on 11/12/13.
//  Copyright (c) 2013 Divu. All rights reserved.
//

#import "BBUViewController.h"

@interface BBUViewController ()

@end

@implementation BBUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    background.animationImages = [NSArray arrayWithObjects:
                                  [UIImage imageNamed:@"bg3.jpg"],
                                  [UIImage imageNamed:@"bg4.jpg"], nil];
    
    background.animationDuration = 1;
    background.animationRepeatCount = -1;
    [background startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
