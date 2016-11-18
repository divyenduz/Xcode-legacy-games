//
//  SIMViewController.h
//  Simon
//
//  Created by Divyendu Singh on 13/12/13.
//  Copyright (c) 2013 Divu. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSMutableArray *memoryArray;
int enabledToggle;
static int currentPointer;
int scoreNumber , highscoreNumber;
@interface SIMViewController : UIViewController
{
    IBOutlet UIButton *startGame;
    IBOutlet UIButton *nextLevel;
    IBOutlet UIButton *yellow;
    IBOutlet UIButton *red;
    IBOutlet UIButton *blue;
    IBOutlet UIButton *green;
    
    IBOutlet UILabel *score;
    IBOutlet UILabel *highscore;
    
    NSTimer *engine;
    NSTimer *gap;
}

-(IBAction)startGame:(id)sender;
-(void)nextLevel;

-(IBAction)yellowClick:(id)sender;
-(IBAction)redClick:(id)sender;
-(IBAction)blueClick:(id)sender;
-(IBAction)greenClick:(id)sender;

-(void)enabledToggle;
-(void)endGame;

-(void)addMemory;
-(void)animate;
@end
