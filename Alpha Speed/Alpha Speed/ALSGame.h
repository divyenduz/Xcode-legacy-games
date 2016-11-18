//
//  ALSGame.h
//  Alpha Speed
//
//  Created by Divyendu Singh on 13/09/14.
//  Copyright (c) 2014 Divu. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *addScoreURL=@"http://divyendusingh.com/services/fiverr/AlphaSpeed/addScore";

bool isHit;

int digitRadius;
int widthRange;

//Memorize last X and Y so there is no collision when new alphabets grow
int previousX=0;
int previousY=0;

//Letter random number
int letter;
int letterRed;//Which will be the answer as well

//Width
int minX;
int maxX;

//Height
int minY;
int maxY;

//Level, Speed and Score
int level;
float speed;
long score;
long highScore;

//gameEngineSpeed and timer
float gameEngineSpeed;
float timer;

int doneRed;

NSString *nameString;

@interface ALSGame : UIViewController
{
    IBOutlet UIWebView *fakeWebView;
    
    IBOutlet UIImageView *red;
    IBOutlet UIImageView *one;
    IBOutlet UIImageView *two;
    IBOutlet UIImageView *three;
    IBOutlet UIImageView *four;
    IBOutlet UIImageView *five;
    
    IBOutlet UIImageView *border;
    
    IBOutlet UIButton *restartGame;
    
    IBOutlet UIButton *keypadA;
    IBOutlet UIButton *keypadB;
    IBOutlet UIButton *keypadC;
    IBOutlet UIButton *keypadD;
    IBOutlet UIButton *keypadE;
    IBOutlet UIButton *keypadF;
    IBOutlet UIButton *keypadG;
    IBOutlet UIButton *keypadH;
    IBOutlet UIButton *keypadI;
    IBOutlet UIButton *keypadJ;
    IBOutlet UIButton *keypadK;
    IBOutlet UIButton *keypadL;
    IBOutlet UIButton *keypadM;
    IBOutlet UIButton *keypadN;
    IBOutlet UIButton *keypadO;
    IBOutlet UIButton *keypadP;
    IBOutlet UIButton *keypadQ;
    IBOutlet UIButton *keypadR;
    IBOutlet UIButton *keypadS;
    IBOutlet UIButton *keypadT;
    IBOutlet UIButton *keypadU;
    IBOutlet UIButton *keypadV;
    IBOutlet UIButton *keypadW;
    IBOutlet UIButton *keypadX;
    IBOutlet UIButton *keypadY;
    IBOutlet UIButton *keypadZ;
    
    IBOutlet UIImageView *levelBoard;
    IBOutlet UIImageView *highestScoreLabel;
    IBOutlet UIButton *seeWorldRankings;
    IBOutlet UILabel *scoreBoard;
    IBOutlet UILabel *scoreLabel;
    
    IBOutlet UILabel *gameOverScore;
    IBOutlet UILabel *gameOverHighScore;
    
    IBOutlet UIImageView *background;
    
    NSTimer *engine;
    NSTimer *correctHit;
}
-(IBAction)keypad:(id)sender;
-(IBAction)restartGame:(id)sender;
@end
