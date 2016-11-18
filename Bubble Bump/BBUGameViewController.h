//
//  BBUGameViewController.h
//  Bubble Bump
//
//  Created by Divyendu Singh on 11/12/13.
//  Copyright (c) 2013 Divu. All rights reserved.
//

#import <UIKit/UIKit.h>

static int oldColor;
int randomColorNumber, score;
int direction , vertical;
@interface BBUGameViewController : UIViewController
{
    IBOutlet UIButton *exit;
    
    IBOutlet UILabel *scoreLabel;
    
    IBOutlet UILabel *targetColorLabel;
    IBOutlet UIImageView *targetColorImageView;
    
    IBOutlet UIImageView *player;
    
    IBOutlet UIImageView *bubble1;
    IBOutlet UIImageView *bubble2;
    IBOutlet UIImageView *bubble3;
    IBOutlet UIImageView *bubble4;
    
    NSTimer *bubbleChangeTimer;
    NSTimer *engine;
    NSTimer *jump;
}
-(void)initialize;
-(void)bubbleMovement;
-(void)bubbleChange;
-(void)jump;
-(void)collisionDetection;
-(void)endGame;
@end
