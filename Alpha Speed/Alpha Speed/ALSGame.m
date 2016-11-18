//
//  ALSGame.m
//  Alpha Speed
//
//  Created by Divyendu Singh on 13/09/14.
//  Copyright (c) 2014 Divu. All rights reserved.
//

#import "ALSGame.h"
#import <AVFoundation/AVFoundation.h>

@interface ALSGame ()
@property (nonatomic, strong) AVAudioPlayer *Audio;
@property (nonatomic, strong) AVAudioPlayer *BGM;
@end

@implementation ALSGame

-(IBAction)restartGame:(id)sender{
    [self startGame];
}
-(IBAction)keypad:(id)sender{
    NSLog(@"%ld",(long)[sender tag]);
    long hit = [sender tag];
    if (hit==letterRed) {
        
        isHit=YES;
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5];
        [red setAlpha:0];
        [UIView commitAnimations];
        
        [self score];
        
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"hit" withExtension:@"aiff"];
        NSAssert(url, @"URL is valid.");
        NSError* error = nil;
        self.Audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if(!self.Audio)
        {
            NSLog(@"Error creating player: %@", error);
        }
        else
        {
            [self.Audio play];
        }
        
        correctHit=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(correctHit) userInfo:nil repeats:NO];
    }
}

-(void)correctHit{
    NSLog(@"Inside correctHit function");
    
    doneRed=0;
    
    red=[self newLetter: red];
    red.center=[self randomPoint];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.001];
    [red setAlpha:100];
    [UIView commitAnimations];
    
    isHit=NO;
}

-(void)score{
    NSLog(@"Inside score function");
    score=score+level*2;
    NSLog(@"%ld",score);
    
    scoreBoard.text=[NSString stringWithFormat:@"%ld",score];
    
    NSLog(@"End score function");
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"Inside initWithNibName function");
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"Inside viewDidLoad function");
    [super viewDidLoad];
    [self startGame];
}


-(void)startGame{
    NSLog(@"Inside startGame function");
    
    isHit=NO;
    
    digitRadius=25;
    widthRange=640;
    
    score=0;
    
    //Width
    minX=25+40;
    maxX=295-40;
    
    //Height
    minY=400;
    maxY=800;
    
    previousX=0;
    previousY=minY;
    
    levelBoard.image=[UIImage imageNamed:@"Level1.png"];
    //Level and Score
    level=1;
    score=0;
    highScore=0;
    
    //gameEngineSpeed and timer
    gameEngineSpeed=0.02;
    timer=0;
    
    doneRed = 0;

    one=[self newLetter:one];
    two=[self newLetter:two];
    three=[self newLetter:three];
    four=[self newLetter:four];
    five=[self newLetter:five];
    red=[self newLetter:red];
    
    one.center=[self randomPoint];
    two.center=[self randomPoint];
    three.center=[self randomPoint];
    four.center=[self randomPoint];
    five.center=[self randomPoint];
    red.center=[self randomPoint];
    
    engine=[NSTimer scheduledTimerWithTimeInterval:gameEngineSpeed target:self selector:@selector(engine) userInfo:nil repeats:YES];
    
    highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"highscore"];
    seeWorldRankings.hidden=YES;
    highestScoreLabel.hidden=YES;
    gameOverHighScore.hidden=YES;
    gameOverScore.hidden=YES;
    
    scoreBoard.font = [UIFont fontWithName:@"linowrite" size:14];
    scoreLabel.font = [UIFont fontWithName:@"linowrite" size:14];
    gameOverScore.font = [UIFont fontWithName:@"linowrite" size:14];
    gameOverHighScore.font = [UIFont fontWithName:@"linowrite" size:14];
    
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"bgm" withExtension:@"mp3"];
    NSAssert(url, @"URL is valid.");
    NSError* error = nil;
    self.BGM = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if(!self.BGM)
    {
        NSLog(@"Error creating player: %@", error);
    }
    else
    {
        [self.BGM setNumberOfLoops:-1];
        [self.BGM play];
    }

    restartGame.hidden=YES;
    background.image = [UIImage imageNamed:@"background.png"];
    
    scoreBoard.hidden=NO;
    scoreLabel.hidden=NO;
    levelBoard.hidden=NO;
    one.hidden=NO;
    two.hidden=NO;
    three.hidden=NO;
    four.hidden=NO;
    five.hidden=NO;
    red.hidden=NO;
    
    NSString *userName=[[NSUserDefaults standardUserDefaults] stringForKey:@"savedName"];
    if (userName!=nil) {
        nameString=userName;
    }else{
        nameString = [NSString stringWithFormat:@"%@%@", @"user",[NSString stringWithFormat:@"%u", arc4random_uniform(100000)]];
    }
}

-(void)engine
{
    if(!isHit){
        red.center=CGPointMake(red.center.x, red.center.y-level);
    }
    one.center=CGPointMake(one.center.x, one.center.y-level);
    two.center=CGPointMake(two.center.x, two.center.y-level);
    three.center=CGPointMake(three.center.x, three.center.y-level);
    four.center=CGPointMake(four.center.x, four.center.y-level);
    five.center=CGPointMake(five.center.x, five.center.y-level);
    
    if (one.center.y<-digitRadius) {
        one=[self newLetter:one];
        one.center=[self randomPoint];
    }
    
    if (two.center.y<-digitRadius) {
        two=[self newLetter:two];
        two.center=[self randomPoint];
    }
    
    if (three.center.y<-digitRadius) {
        three=[self newLetter:three];
        three.center=[self randomPoint];
    }
    
    if (four.center.y<-digitRadius) {
        four=[self newLetter:four];
        four.center=[self randomPoint];
    }
    
    if (five.center.y<-digitRadius) {
        five=[self newLetter:five];
        five.center=[self randomPoint];
    }
    
    if (red.center.y<-digitRadius) {
        red=[self newLetter: red];
        red.center=[self randomPoint];
        
        //GAME OVER
        [self gameOver];
    }
    
    if (red.center.y>250&&red.center.y<300&&doneRed==0) {
        red=[self newLetterRed:red];
        doneRed=1;
    }
    
    [self levelUp];
}

-(void)gameOver{
    NSLog(@"Inside gameOver function");
    
    background.image = [UIImage imageNamed:@"GameOver.png"];
    scoreBoard.hidden=YES;
    one.hidden=YES;
    two.hidden=YES;
    three.hidden=YES;
    four.hidden=YES;
    five.hidden=YES;
    red.hidden=YES;
    levelBoard.hidden=YES;
    scoreLabel.hidden=YES;
    
    if (score>highScore) {
        NSLog(@"Inside high score IF");
        highScore=score;
        [[NSUserDefaults standardUserDefaults]setInteger:highScore forKey:@"highscore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSString *link=[NSString stringWithFormat:@"%@?name=%@&score=%ld",addScoreURL,nameString,highScore];
        NSLog(@"URL: %@",link);
        NSURL *url = [NSURL URLWithString:link];
        /*NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [fakeWebView loadRequest:requestObj];*/
        NSURLRequest *req = [ NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestReloadIgnoringCacheData
                                          timeoutInterval:30.0 ];
        NSError *err;
        NSURLResponse *res;
        NSData *d = [ NSURLConnection sendSynchronousRequest:req
                                           returningResponse:&res
                                                       error:&err ];
    }
    
    gameOverScore.text=[NSString stringWithFormat:@"%ld letters",score];
    gameOverHighScore.text=[NSString stringWithFormat:@"%ld letters",highScore];
    
    seeWorldRankings.hidden=NO;
    highestScoreLabel.hidden=NO;
    gameOverHighScore.hidden=NO;
    gameOverScore.hidden=NO;
    
    [self.BGM stop];
    
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"gameover" withExtension:@"aiff"];
    NSAssert(url, @"URL is valid.");
    NSError* error = nil;
    self.Audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if(!self.Audio)
    {
        NSLog(@"Error creating player: %@", error);
    }
    else
    {
        [self.Audio play];
    }
    
    [engine invalidate];
    restartGame.hidden=NO;
}

-(void) levelUp{
    //NSLog(@"Inside levelUp function");
    timer=timer+gameEngineSpeed;
    //NSLog(@"Timer: %f", timer);
    if (timer>30) {
        levelBoard.image=[UIImage imageNamed:@"Level2.png"];
        level=2;
    }
    
    if (timer>60) {
        levelBoard.image=[UIImage imageNamed:@"Level3.png"];
        level=3;
    }
    
    if (timer>90) {
        levelBoard.image=[UIImage imageNamed:@"Level4.png"];
        level=4;
    }
    
    if (timer>120) {
        levelBoard.image=[UIImage imageNamed:@"Level5.png"];
        level=5;
    }
    
    if (timer>150) {
        levelBoard.image=[UIImage imageNamed:@"Level6.png"];
        level=6;
    }
    
    if (timer>180) {
        levelBoard.image=[UIImage imageNamed:@"Level7.png"];
        level=7;
    }
    
    if (timer>210) {
        levelBoard.image=[UIImage imageNamed:@"Level8.png"];
        level=8;
    }
    
    if (timer>240) {
        levelBoard.image=[UIImage imageNamed:@"Level9.png"];
        level=9;
    }
    
    if (timer>270) {
        levelBoard.image=[UIImage imageNamed:@"Level10.png"];
        level=10;
    }
}

- (void)didReceiveMemoryWarning
{
    NSLog(@"Inside didReceiveMemoryWarning function");
    [super didReceiveMemoryWarning];
}

- (CGPoint)randomPoint{
    NSLog(@"Inside randomPoint function");
    NSLog(@"PrevY: %d", previousY);
    
    int x=minX + arc4random_uniform(maxX - minX + 1);
    int y=previousY + 40 + arc4random_uniform(180 - 40 + 1);
    
    previousY=y;
    if(previousY>maxY)
        previousY=minY;
    
    return CGPointMake(x, y);
}

-(UIImageView *)newLetterRed:(UIImageView *) result
{
    //NSLog(@"Inside newLetterRed function");
    letterRed=0 + arc4random_uniform(25 - 0 + 1);
    NSLog(@"Letter Red: %d",letterRed);
    if(letterRed==0)
        result.image=[UIImage imageNamed:@"RA_Big.png"];
    else if(letterRed==1)
        result.image=[UIImage imageNamed:@"RB_Big.png"];
    else if(letterRed==2)
        result.image=[UIImage imageNamed:@"RC_Big.png"];
    else if(letterRed==3)
        result.image=[UIImage imageNamed:@"RD_Big.png"];
    else if(letterRed==4)
        result.image=[UIImage imageNamed:@"RE_Big.png"];
    else if(letterRed==5)
        result.image=[UIImage imageNamed:@"RF_Big.png"];
    else if(letterRed==6)
        result.image=[UIImage imageNamed:@"RG_Big.png"];
    else if(letterRed==7)
        result.image=[UIImage imageNamed:@"RH_Big.png"];
    else if(letterRed==8)
        result.image=[UIImage imageNamed:@"RI_Big.png"];
    else if(letterRed==9)
        result.image=[UIImage imageNamed:@"RJ_Big.png"];
    else if(letterRed==10)
        result.image=[UIImage imageNamed:@"RK_Big.png"];
    else if(letterRed==11)
        result.image=[UIImage imageNamed:@"RL_Big.png"];
    else if(letterRed==12)
        result.image=[UIImage imageNamed:@"RM_Big.png"];
    else if(letterRed==13)
        result.image=[UIImage imageNamed:@"RN_Big.png"];
    else if(letterRed==14)
        result.image=[UIImage imageNamed:@"RO_Big.png"];
    else if(letterRed==15)
        result.image=[UIImage imageNamed:@"RP_Big.png"];
    else if(letterRed==16)
        result.image=[UIImage imageNamed:@"RQ_Big.png"];
    else if(letterRed==17)
        result.image=[UIImage imageNamed:@"RR_Big.png"];
    else if(letterRed==18)
        result.image=[UIImage imageNamed:@"RS_Big.png"];
    else if(letterRed==19)
        result.image=[UIImage imageNamed:@"RT_Big.png"];
    else if(letterRed==20)
        result.image=[UIImage imageNamed:@"RY_Big.png"];
    else if(letterRed==21)
        result.image=[UIImage imageNamed:@"RV_Big.png"];
    else if(letterRed==22)
        result.image=[UIImage imageNamed:@"RW_Big.png"];
    else if(letterRed==23)
        result.image=[UIImage imageNamed:@"RX_Big.png"];
    else if(letterRed==24)
        result.image=[UIImage imageNamed:@"RY_Big.png"];
    else
        result.image=[UIImage imageNamed:@"RZ_Big.png"];
    return result;
}

-(UIImageView *)newLetter:(UIImageView *) result
{
    //NSLog(@"Inside newLetter function");
    letter=0 + arc4random_uniform(25 - 0 + 1);
    //NSLog(@"Letter: %d",letter);
    if(letter==0)
        result.image=[UIImage imageNamed:@"A_Big.png"];
    else if(letter==1)
        result.image=[UIImage imageNamed:@"B_Big.png"];
    else if(letter==2)
        result.image=[UIImage imageNamed:@"C_Big.png"];
    else if(letter==3)
        result.image=[UIImage imageNamed:@"D_Big.png"];
    else if(letter==4)
        result.image=[UIImage imageNamed:@"E_Big.png"];
    else if(letter==5)
        result.image=[UIImage imageNamed:@"F_Big.png"];
    else if(letter==6)
        result.image=[UIImage imageNamed:@"G_Big.png"];
    else if(letter==7)
        result.image=[UIImage imageNamed:@"H_Big.png"];
    else if(letter==8)
        result.image=[UIImage imageNamed:@"I_Big.png"];
    else if(letter==9)
        result.image=[UIImage imageNamed:@"J_Big.png"];
    else if(letter==10)
        result.image=[UIImage imageNamed:@"K_Big.png"];
    else if(letter==11)
        result.image=[UIImage imageNamed:@"L_Big.png"];
    else if(letter==12)
        result.image=[UIImage imageNamed:@"M_Big.png"];
    else if(letter==13)
        result.image=[UIImage imageNamed:@"N_Big.png"];
    else if(letter==14)
        result.image=[UIImage imageNamed:@"O_Big.png"];
    else if(letter==15)
        result.image=[UIImage imageNamed:@"P_Big.png"];
    else if(letter==16)
        result.image=[UIImage imageNamed:@"Q_Big.png"];
    else if(letter==17)
        result.image=[UIImage imageNamed:@"R_Big.png"];
    else if(letter==18)
        result.image=[UIImage imageNamed:@"S_Big.png"];
    else if(letter==19)
        result.image=[UIImage imageNamed:@"T_Big.png"];
    else if(letter==20)
        result.image=[UIImage imageNamed:@"Y_Big.png"];
    else if(letter==21)
        result.image=[UIImage imageNamed:@"V_Big.png"];
    else if(letter==22)
        result.image=[UIImage imageNamed:@"W_Big.png"];
    else if(letter==23)
        result.image=[UIImage imageNamed:@"X_Big.png"];
    else if(letter==24)
        result.image=[UIImage imageNamed:@"Y_Big.png"];
    else
        result.image=[UIImage imageNamed:@"Z_Big.png"];
    return result;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
