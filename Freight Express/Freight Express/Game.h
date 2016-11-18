//
//  Game.h
//  Freight Express
//
//  Created by Divyendu Singh on 30/08/14.
//  Copyright (c) 2014 Divu. All rights reserved.
//

#import <UIKit/UIKit.h>

int timeInSec=0;
int invokePlatform=0;
int currentGreen=0;
int scoreNumber=0;

int qMarkOne=0;
int qMarkTwo=0;
int qMarkThree=0;
int qMarkFour=0;
int qMarkFive=0;

int globalClicks=0;

NSArray *score;

@interface Game : UIViewController
{
    IBOutlet UIImageView *signal1;
    IBOutlet UIImageView *signal2;
    IBOutlet UIImageView *signal3;
    
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *resultLabel;
    
    IBOutlet UILabel *numLabel;
    IBOutlet UIImageView *num1;
    IBOutlet UIImageView *num2;
    IBOutlet UIImageView *num3;
    IBOutlet UIImageView *num4;
    IBOutlet UIImageView *num5;
    IBOutlet UIImageView *num6;
    IBOutlet UIImageView *num7;
    IBOutlet UIImageView *num8;
    IBOutlet UIImageView *num9;
    IBOutlet UIImageView *num0;
    IBOutlet UIImageView *numgo;
    
    IBOutlet UIImageView *trainEngine1;
    IBOutlet UIImageView *trainEngine2;
    IBOutlet UIImageView *trainEngine3;
    IBOutlet UIImageView *trainEngine4;
    IBOutlet UIImageView *trainEngine5;
    
    IBOutlet UIImageView *trainBogey1a;
    IBOutlet UIImageView *trainBogey1b;
    IBOutlet UIImageView *trainBogey1c;
    IBOutlet UIImageView *trainBogey1d;
    
    IBOutlet UIImageView *trainBogey2a;
    IBOutlet UIImageView *trainBogey2b;
    IBOutlet UIImageView *trainBogey2c;
    IBOutlet UIImageView *trainBogey2d;
    
    IBOutlet UIImageView *trainBogey3a;
    IBOutlet UIImageView *trainBogey3b;
    IBOutlet UIImageView *trainBogey3c;
    IBOutlet UIImageView *trainBogey3d;
    
    IBOutlet UIImageView *trainBogey4a;
    IBOutlet UIImageView *trainBogey4b;
    IBOutlet UIImageView *trainBogey4c;
    IBOutlet UIImageView *trainBogey4d;
    
    IBOutlet UIImageView *trainBogey5a;
    IBOutlet UIImageView *trainBogey5b;
    IBOutlet UIImageView *trainBogey5c;
    IBOutlet UIImageView *trainBogey5d;
    
    CGImageRef oneImage;
    CGImageRef twoImage;
    CGImageRef threeImage;
    CGImageRef fourImage;
    CGImageRef fiveImage;
    CGImageRef sixImage;
    CGImageRef sevenImage;
    CGImageRef eightImage;
    CGImageRef nineImage;
    CGImageRef zeroImage;
    CGImageRef qMark;
    CGImageRef cMark;
    
    UIImageView *oneView;
    UIImageView *twoView;
    UIImageView *threeView;
    UIImageView *fourView;
    UIImageView *fiveView;
    UIImageView *qMarkView;
    UIImageView *cMarkView;
    
    UIImageView *oneView2;
    UIImageView *threeView2;
    UIImageView *fiveView2;
    UIImageView *sevenView2;
    UIImageView *nineView2;
    UIImageView *qMarkView2;
    UIImageView *cMarkView2;
    
    UIImageView *oneView3;
    UIImageView *twoView3;
    UIImageView *threeView3;
    UIImageView *fiveView3;
    UIImageView *eightView3;
    UIImageView *qMarkView3;
    UIImageView *cMarkView3;
    
    UIImageView *oneView4a;
    UIImageView *oneView4b;
    UIImageView *twoView4a;
    UIImageView *twoView4b;
    UIImageView *threeView4a;
    UIImageView *qMarkView4;
    UIImageView *cMarkView4;
    
    UIImageView *zeroView5;
    UIImageView *twoView5;
    UIImageView *fourView5;
    UIImageView *sixView5;
    UIImageView *eightView5;
    UIImageView *qMarkView5;
    UIImageView *cMarkView5;
    
    NSTimer *timer;
    NSTimer *engineOne;
    NSTimer *engineTwo;
    NSTimer *engineThree;
    NSTimer *engineFour;
    NSTimer *engineFive;
}
-(void)getNumbersInPlace;
@end
