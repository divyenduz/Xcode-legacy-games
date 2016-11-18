//
//  Game.m
//  Freight Express
//
//  Created by Divyendu Singh on 30/08/14.
//  Copyright (c) 2014 Divu. All rights reserved.
//

#import "Game.h"
#import <AVFoundation/AVFoundation.h>
@interface Game ()
@property (nonatomic, strong) AVAudioPlayer *signalChange;
@property (nonatomic, strong) AVAudioPlayer *BGM;
@end

@implementation Game

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)num0Method
{
    scoreNumber-=5;
    scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    [self invokeCrossMark:invokePlatform];
    [self hideNumPad:YES];
}

-(void)num1Method
{
    scoreNumber-=5;
    scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    [self invokeCrossMark:invokePlatform];
    [self hideNumPad:YES];
}

-(void)num2Method
{
    scoreNumber-=5;
    scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    [self invokeCrossMark:invokePlatform];
    [self hideNumPad:YES];
}

-(void)num3Method
{
    if(invokePlatform==3)
    {
        scoreNumber += 10;
        threeView4a.hidden=NO;
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    else
    {
        scoreNumber-=5;
        [self invokeCrossMark:invokePlatform];
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    [self hideNumPad:YES];
}

-(void)num4Method
{
    scoreNumber-=5;
    scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    [self invokeCrossMark:invokePlatform];
    [self hideNumPad:YES];
}

-(void)num5Method
{
    if(invokePlatform==0)
    {
        scoreNumber += 10;
        fiveView.hidden=NO;
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    else
    {
        scoreNumber-=5;
        [self invokeCrossMark:invokePlatform];
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    [self hideNumPad:YES];
}

-(void)num6Method
{
    scoreNumber-=5;
    scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    [self invokeCrossMark:invokePlatform];
    [self hideNumPad:YES];
}

-(void)num7Method
{
    scoreNumber-=5;
    scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    [self invokeCrossMark:invokePlatform];
    [self hideNumPad:YES];
}

-(void)num8Method
{
    if(invokePlatform==2)
    {
        scoreNumber += 10;
        eightView3.hidden=NO;
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    else if(invokePlatform==4)
    {
        scoreNumber += 10;
        eightView5.hidden=NO;
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    else
    {
        scoreNumber-=5;
        [self invokeCrossMark:invokePlatform];
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    [self hideNumPad:YES];
}

-(void)num9Method
{
    if(invokePlatform==1)
    {
        scoreNumber += 10;
        nineView2.hidden=NO;
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    else
    {
        scoreNumber-=5;
        [self invokeCrossMark:invokePlatform];
        scoreLabel.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    }
    [self hideNumPad:YES];
}

-(void)invokeCrossMark:(int)invokePlatform
{
    if (invokePlatform==0) {
        cMarkView.hidden=NO;
    }
    if (invokePlatform==1) {
        cMarkView2.hidden=NO;
    }
    if (invokePlatform==2) {
        cMarkView3.hidden=NO;
    }
    if (invokePlatform==3) {
        cMarkView4.hidden=NO;
    }
    if (invokePlatform==4) {
        cMarkView5.hidden=NO;
    }
}

-(void)hideNumPad:(bool)state
{
    if(state)
    {
        
        globalClicks+=1;
        if (globalClicks==5) {
            num0.hidden=YES;
            num1.hidden=YES;
            num2.hidden=YES;
            
            if (scoreNumber==50) {
                resultLabel.hidden=NO;
                resultLabel.text=@"Cleared";
                [timer invalidate];
            }
            else {
                resultLabel.hidden=NO;
                resultLabel.text=@"Failed";
                [timer invalidate];
            }
        }

        
        if (invokePlatform==0) {
            
            engineOne=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(trainOneOut) userInfo:nil repeats:YES];
        }
        
        if (invokePlatform==1) {
            engineTwo=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(trainTwoOut) userInfo:nil repeats:YES];
        }
        
        if (invokePlatform==2) {
            engineThree=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(trainThreeOut) userInfo:nil repeats:YES];
        }
        
        if (invokePlatform==3) {
            engineFour=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(trainFourOut) userInfo:nil repeats:YES];
        }
        
        if (invokePlatform==4) {
            engineFive=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(trainFiveOut) userInfo:nil repeats:YES];
        }
        
        invokePlatform=(invokePlatform+1)%5;
        [self signalManager:invokePlatform];
    }
    
}

-(void) signalManager:(int) invokePlatform
{
    signal1.image = [UIImage imageNamed:@"SignalRed.png"];
    signal2.image = [UIImage imageNamed:@"SignalRed.png"];
    signal3.image = [UIImage imageNamed:@"SignalRed.png"];
    
    currentGreen=(invokePlatform)%3;
    if(currentGreen==0)
        signal1.image = [UIImage imageNamed:@"signalGreen.png"];
    if(currentGreen==1)
        signal2.image = [UIImage imageNamed:@"signalGreen.png"];
    if(currentGreen==2)
        signal3.image = [UIImage imageNamed:@"signalGreen.png"];
}

-(void) trainOneOut
{
    qMarkOne=1;
    qMarkView.hidden=YES;
    [self trainOneChain:-800];
}

-(void) trainTwoOut
{
    qMarkTwo=1;
    qMarkView2.hidden=YES;
    [self trainTwoChain:-800];
}

-(void) trainThreeOut
{
    qMarkThree=1;
    qMarkView3.hidden=YES;
    [self trainThreeChain:-800];
}

-(void) trainFourOut
{
    qMarkFour=1;
    qMarkView4.hidden=YES;
    [self trainFourChain:-800];
}

-(void) trainFiveOut
{
    qMarkFive=1;
    qMarkView5.hidden=YES;
    [self trainFiveChain:-800];
}

- (void)viewDidLoad
{
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
    
    [super viewDidLoad];
    
    resultLabel.hidden = YES;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCounter) userInfo:nil repeats:YES];
    [self hideTrainOne:YES];
    [self hideTrainTwo:YES];
    [self hideTrainThree:YES];
    [self hideTrainFour:YES];
    [self hideTrainFive:YES];
    
    [self getNumbersInPlace];
    [self getNumPadInPlace];
    
    engineOne = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(moveTrainOne) userInfo:nil repeats:YES];
    
    UITapGestureRecognizer *trainOneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(trainOneMethod)];
    [trainBogey1d setUserInteractionEnabled:YES];
    [trainBogey1d addGestureRecognizer:trainOneTap];
    
    UITapGestureRecognizer *trainTwoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(trainTwoMethod)];
    [trainBogey2d setUserInteractionEnabled:YES];
    [trainBogey2d addGestureRecognizer:trainTwoTap];
    
    UITapGestureRecognizer *trainThreeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(trainThreeMethod)];
    [trainBogey3d setUserInteractionEnabled:YES];
    [trainBogey3d addGestureRecognizer:trainThreeTap];
    
    UITapGestureRecognizer *trainFourTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(trainFourMethod)];
    [trainBogey4d setUserInteractionEnabled:YES];
    [trainBogey4d addGestureRecognizer:trainFourTap];
    
    UITapGestureRecognizer *trainFiveTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(trainFiveMethod)];
    [trainBogey5d setUserInteractionEnabled:YES];
    [trainBogey5d addGestureRecognizer:trainFiveTap];
    
    UITapGestureRecognizer *num0Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num0Method)];
    [num0 setUserInteractionEnabled:YES];
    [num0 addGestureRecognizer:num0Tap];
    
    UITapGestureRecognizer *num1Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num1Method)];
    [num1 setUserInteractionEnabled:YES];
    [num1 addGestureRecognizer:num1Tap];
    
    UITapGestureRecognizer *num2Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num2Method)];
    [num2 setUserInteractionEnabled:YES];
    [num2 addGestureRecognizer:num2Tap];
    
    UITapGestureRecognizer *num3Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num3Method)];
    [num3 setUserInteractionEnabled:YES];
    [num3 addGestureRecognizer:num3Tap];
    
    UITapGestureRecognizer *num4Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num4Method)];
    [num4 setUserInteractionEnabled:YES];
    [num4 addGestureRecognizer:num4Tap];
    
    UITapGestureRecognizer *num5Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num5Method)];
    [num5 setUserInteractionEnabled:YES];
    [num5 addGestureRecognizer:num5Tap];
    
    UITapGestureRecognizer *num6Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num6Method)];
    [num6 setUserInteractionEnabled:YES];
    [num6 addGestureRecognizer:num6Tap];
    
    UITapGestureRecognizer *num7Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num7Method)];
    [num7 setUserInteractionEnabled:YES];
    [num7 addGestureRecognizer:num7Tap];
    
    UITapGestureRecognizer *num8Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num8Method)];
    [num8 setUserInteractionEnabled:YES];
    [num8 addGestureRecognizer:num8Tap];
    
    UITapGestureRecognizer *num9Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(num9Method)];
    [num9 setUserInteractionEnabled:YES];
    [num9 addGestureRecognizer:num9Tap];
}

-(void)timeCounter
{
    timeInSec+=1;
    if(timeInSec==5)
    {
        engineTwo = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveTrainTwo) userInfo:nil repeats:YES];
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"change" withExtension:@"aiff"];
        NSAssert(url, @"URL is valid.");
        NSError* error = nil;
        self.signalChange = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if(!self.signalChange)
        {
            NSLog(@"Error creating player: %@", error);
        }
        else
        {
            [self.signalChange play];
        }
    }
    
    if(timeInSec==10)
    {
        engineThree = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveTrainThree) userInfo:nil repeats:YES];
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"change" withExtension:@"aiff"];
        NSAssert(url, @"URL is valid.");
        NSError* error = nil;
        self.signalChange = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if(!self.signalChange)
        {
            NSLog(@"Error creating player: %@", error);
        }
        else
        {
            [self.signalChange play];
        }
    }
    
    if(trainEngine1.center.y<-800)
    {
        trainEngine4.hidden=NO;
        trainEngine4.center = CGPointMake(416, 750);
        engineFour=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveTrainFour) userInfo:nil repeats:YES];
        trainEngine1.center = CGPointMake(416, 1000);
    }
    
    if(trainEngine2.center.y<-800)
    {
        trainEngine5.hidden=NO;
        trainEngine5.center = CGPointMake(578, 750);
        engineFive=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(moveTrainFive) userInfo:nil repeats:YES];
        trainEngine2.center = CGPointMake(578, 1000);
    }
}

-(void)trainOneMethod
{
    invokePlatform=0;
    [self signalManager:invokePlatform];
    [self hideNumPad:NO];
}

-(void)trainTwoMethod
{
    invokePlatform=1;
    [self signalManager:invokePlatform];
    [self hideNumPad:NO];
}

-(void)trainThreeMethod
{
    invokePlatform=2;
    [self signalManager:invokePlatform];
    [self hideNumPad:NO];
}

-(void)trainFourMethod
{
    invokePlatform=3;
    [self signalManager:invokePlatform];
    [self hideNumPad:NO];
}

-(void)trainFiveMethod
{
    invokePlatform=4;
    [self signalManager:invokePlatform];
    [self hideNumPad:NO];
}

-(void)moveTrainOne
{
    [self trainOneChain:162];
}

-(void)moveTrainTwo
{
    [self trainTwoChain:162];
}

-(void)moveTrainThree
{
    [self trainThreeChain:162];
}

-(void)moveTrainFour
{
    [self trainFourChain:162];
}

-(void)moveTrainFive
{
    [self trainFiveChain:162];
}

-(void)trainOneChain:(int)stop
{
    oneView.hidden=NO;
    int trainWidth=150;
    trainBogey1d.center = CGPointMake(trainBogey1c.center.x, trainBogey1c.center.y);
    trainBogey1c.center = CGPointMake(trainBogey1b.center.x, trainBogey1b.center.y);
    trainBogey1b.center = CGPointMake(trainBogey1a.center.x, trainBogey1a.center.y);
    trainBogey1a.center = CGPointMake(trainEngine1.center.x, trainEngine1.center.y);
    trainEngine1.center = CGPointMake(trainEngine1.center.x, trainEngine1.center.y - trainWidth);
    
    if (trainEngine1.center.y<stop) {
        [engineOne invalidate];
    }
    
    if(trainBogey1a.center.y>trainEngine1.center.y)
    {
        trainBogey1a.hidden=NO;
        twoView.hidden=NO;
    }
    
    if(trainBogey1b.center.y>trainEngine1.center.y)
    {
        trainBogey1b.hidden=NO;
        threeView.hidden=NO;
    }
    
    if(trainBogey1c.center.y>trainEngine1.center.y)
    {
        trainBogey1c.hidden=NO;
        fourView.hidden=NO;
    }
    
    if(trainBogey1d.center.y>trainEngine1.center.y)
    {
        trainBogey1d.hidden=NO;
        if(qMarkOne==0)
            qMarkView.hidden=NO;
    }
    
    oneView.center = CGPointMake(trainEngine1.center.x, trainEngine1.center.y+55);
    twoView.center = CGPointMake(trainBogey1a.center.x, trainBogey1a.center.y);
    threeView.center = CGPointMake(trainBogey1b.center.x, trainBogey1b.center.y);
    fourView.center = CGPointMake(trainBogey1c.center.x, trainBogey1c.center.y);
    fiveView.center = CGPointMake(trainBogey1d.center.x, trainBogey1d.center.y);
    qMarkView.center = CGPointMake(trainBogey1d.center.x, trainBogey1d.center.y);
    cMarkView.center = CGPointMake(trainBogey1d.center.x, trainBogey1d.center.y);
}

-(void)trainTwoChain:(int)stop
{
    oneView2.hidden=NO;
    int trainWidth=150;
    trainBogey2d.center = CGPointMake(trainBogey2c.center.x, trainBogey2c.center.y);
    trainBogey2c.center = CGPointMake(trainBogey2b.center.x, trainBogey2b.center.y);
    trainBogey2b.center = CGPointMake(trainBogey2a.center.x, trainBogey2a.center.y);
    trainBogey2a.center = CGPointMake(trainEngine2.center.x, trainEngine2.center.y);
    trainEngine2.center = CGPointMake(trainEngine2.center.x, trainEngine2.center.y - trainWidth);
    
    if (trainEngine2.center.y<stop) {
        [engineTwo invalidate];
    }
    
    if(trainBogey2a.center.y>trainEngine2.center.y)
    {
        trainBogey2a.hidden=NO;
        threeView2.hidden=NO;
    }
    
    if(trainBogey2b.center.y>trainEngine2.center.y)
    {
        trainBogey2b.hidden=NO;
        fiveView2.hidden=NO;
    }
    
    if(trainBogey2c.center.y>trainEngine2.center.y)
    {
        trainBogey2c.hidden=NO;
        sevenView2.hidden=NO;
    }
    
    if(trainBogey2d.center.y>trainEngine2.center.y)
    {
        trainBogey2d.hidden=NO;
        if(qMarkTwo==0)
            qMarkView2.hidden=NO;
    }
    
    oneView2.center = CGPointMake(trainEngine2.center.x, trainEngine2.center.y+55);
    threeView2.center = CGPointMake(trainBogey2a.center.x, trainBogey2a.center.y);
    fiveView2.center = CGPointMake(trainBogey2b.center.x, trainBogey2b.center.y);
    sevenView2.center = CGPointMake(trainBogey2c.center.x, trainBogey2c.center.y);
    nineView2.center = CGPointMake(trainBogey2d.center.x, trainBogey2d.center.y);
    qMarkView2.center = CGPointMake(trainBogey2d.center.x, trainBogey2d.center.y);
    cMarkView2.center = CGPointMake(trainBogey2d.center.x, trainBogey2d.center.y);
}

-(void)trainThreeChain:(int)stop
{
    oneView3.hidden=NO;
    int trainWidth=150;
    trainBogey3d.center = CGPointMake(trainBogey3c.center.x, trainBogey3c.center.y);
    trainBogey3c.center = CGPointMake(trainBogey3b.center.x, trainBogey3b.center.y);
    trainBogey3b.center = CGPointMake(trainBogey3a.center.x, trainBogey3a.center.y);
    trainBogey3a.center = CGPointMake(trainEngine3.center.x, trainEngine3.center.y);
    trainEngine3.center = CGPointMake(trainEngine3.center.x, trainEngine3.center.y - trainWidth);
    
    if (trainEngine3.center.y<stop) {
        [engineThree invalidate];
    }
    
    if(trainBogey3a.center.y>trainEngine3.center.y)
    {
        trainBogey3a.hidden=NO;
        twoView3.hidden=NO;
    }
    
    if(trainBogey3b.center.y>trainEngine3.center.y)
    {
        trainBogey3b.hidden=NO;
        threeView3.hidden=NO;
    }
    
    if(trainBogey3c.center.y>trainEngine3.center.y)
    {
        trainBogey3c.hidden=NO;
        fiveView3.hidden=NO;
    }
    
    if(trainBogey3d.center.y>trainEngine3.center.y)
    {
        trainBogey3d.hidden=NO;
        if(qMarkThree==0)
            qMarkView3.hidden=NO;
    }
    
    oneView3.center = CGPointMake(trainEngine3.center.x, trainEngine3.center.y+55);
    twoView3.center = CGPointMake(trainBogey3a.center.x, trainBogey3a.center.y);
    threeView3.center = CGPointMake(trainBogey3b.center.x, trainBogey3b.center.y);
    fiveView3.center = CGPointMake(trainBogey3c.center.x, trainBogey3c.center.y);
    eightView3.center = CGPointMake(trainBogey3d.center.x, trainBogey3d.center.y);
    qMarkView3.center = CGPointMake(trainBogey3d.center.x, trainBogey3d.center.y);
    cMarkView3.center = CGPointMake(trainBogey3d.center.x, trainBogey3d.center.y);
}

-(void)trainFourChain:(int)stop
{
    oneView4a.hidden=NO;
    int trainWidth=150;
    trainBogey4d.center = CGPointMake(trainBogey4c.center.x, trainBogey4c.center.y);
    trainBogey4c.center = CGPointMake(trainBogey4b.center.x, trainBogey4b.center.y);
    trainBogey4b.center = CGPointMake(trainBogey4a.center.x, trainBogey4a.center.y);
    trainBogey4a.center = CGPointMake(trainEngine4.center.x, trainEngine4.center.y);
    trainEngine4.center = CGPointMake(trainEngine4.center.x, trainEngine4.center.y - trainWidth);
    
    if (trainEngine4.center.y<stop) {
        [engineFour invalidate];
    }
    
    if(trainBogey4a.center.y>trainEngine4.center.y)
    {
        trainBogey4a.hidden=NO;
        oneView4b.hidden=NO;
    }
    
    if(trainBogey4b.center.y>trainEngine4.center.y)
    {
        trainBogey4b.hidden=NO;
        twoView4a.hidden=NO;
    }
    
    if(trainBogey4c.center.y>trainEngine4.center.y)
    {
        trainBogey4c.hidden=NO;
        twoView4b.hidden=NO;
    }
    
    if(trainBogey4d.center.y>trainEngine4.center.y)
    {
        trainBogey4d.hidden=NO;
        if(qMarkFour==0)
            qMarkView4.hidden=NO;
    }
    
    oneView4a.center = CGPointMake(trainEngine4.center.x, trainEngine4.center.y+55);
    oneView4b.center = CGPointMake(trainBogey4a.center.x, trainBogey4a.center.y);
    twoView4a.center = CGPointMake(trainBogey4b.center.x, trainBogey4b.center.y);
    twoView4b.center = CGPointMake(trainBogey4c.center.x, trainBogey4c.center.y);
    threeView4a.center = CGPointMake(trainBogey4d.center.x, trainBogey4d.center.y);
    qMarkView4.center = CGPointMake(trainBogey4d.center.x, trainBogey4d.center.y);
    cMarkView4.center = CGPointMake(trainBogey4d.center.x, trainBogey4d.center.y);
}

-(void)trainFiveChain:(int)stop
{
    zeroView5.hidden=NO;
    int trainWidth=150;
    trainBogey5d.center = CGPointMake(trainBogey5c.center.x, trainBogey5c.center.y);
    trainBogey5c.center = CGPointMake(trainBogey5b.center.x, trainBogey5b.center.y);
    trainBogey5b.center = CGPointMake(trainBogey5a.center.x, trainBogey5a.center.y);
    trainBogey5a.center = CGPointMake(trainEngine5.center.x, trainEngine5.center.y);
    trainEngine5.center = CGPointMake(trainEngine5.center.x, trainEngine5.center.y - trainWidth);
    
    if (trainEngine5.center.y<stop) {
        [engineFive invalidate];
    }
    
    if(trainBogey5a.center.y>trainEngine5.center.y)
    {
        trainBogey5a.hidden=NO;
        twoView5.hidden=NO;
    }
    
    if(trainBogey5b.center.y>trainEngine5.center.y)
    {
        trainBogey5b.hidden=NO;
        fourView5.hidden=NO;
    }
    
    if(trainBogey5c.center.y>trainEngine5.center.y)
    {
        trainBogey5c.hidden=NO;
        sixView5.hidden=NO;
    }
    
    if(trainBogey5d.center.y>trainEngine5.center.y)
    {
        trainBogey5d.hidden=NO;
        if(qMarkFive==0)
            qMarkView5.hidden=NO;
    }
    
    zeroView5.center = CGPointMake(trainEngine5.center.x, trainEngine5.center.y+55);
    twoView5.center = CGPointMake(trainBogey5a.center.x, trainBogey5a.center.y);
    fourView5.center = CGPointMake(trainBogey5b.center.x, trainBogey5b.center.y);
    sixView5.center = CGPointMake(trainBogey5c.center.x, trainBogey5c.center.y);
    eightView5.center = CGPointMake(trainBogey5d.center.x, trainBogey5d.center.y);
    qMarkView5.center = CGPointMake(trainBogey5d.center.x, trainBogey5d.center.y);
    cMarkView5.center = CGPointMake(trainBogey5d.center.x, trainBogey5d.center.y);
}

-(void)hideTrainOne:(bool) state
{
    if(state)
    {
        trainBogey1a.hidden=YES;
        trainBogey1b.hidden=YES;
        trainBogey1c.hidden=YES;
        trainBogey1d.hidden=YES;
    }
    else
    {
        trainBogey1a.hidden=NO;
        trainBogey1b.hidden=NO;
        trainBogey1c.hidden=NO;
        trainBogey1d.hidden=NO;
    }
}

-(void)hideTrainTwo:(bool) state
{
    if(state)
    {
        trainBogey2a.hidden=YES;
        trainBogey2b.hidden=YES;
        trainBogey2c.hidden=YES;
        trainBogey2d.hidden=YES;
    }
    else
    {
        trainBogey2a.hidden=NO;
        trainBogey2b.hidden=NO;
        trainBogey2c.hidden=NO;
        trainBogey2d.hidden=NO;
    }
}

-(void)hideTrainThree:(bool) state
{
    if(state)
    {
        trainBogey3a.hidden=YES;
        trainBogey3b.hidden=YES;
        trainBogey3c.hidden=YES;
        trainBogey3d.hidden=YES;
    }
    else
    {
        trainBogey3a.hidden=NO;
        trainBogey3b.hidden=NO;
        trainBogey3c.hidden=NO;
        trainBogey3d.hidden=NO;
    }
}

-(void)hideTrainFour:(bool) state
{
    if(state)
    {
        trainEngine4.hidden=YES;
        trainBogey4a.hidden=YES;
        trainBogey4b.hidden=YES;
        trainBogey4c.hidden=YES;
        trainBogey4d.hidden=YES;
    }
    else
    {
        trainBogey4a.hidden=NO;
        trainBogey4b.hidden=NO;
        trainBogey4c.hidden=NO;
        trainBogey4d.hidden=NO;
    }
}

-(void)hideTrainFive:(bool) state
{
    if(state)
    {
        trainEngine5.hidden=YES;
        trainBogey5a.hidden=YES;
        trainBogey5b.hidden=YES;
        trainBogey5c.hidden=YES;
        trainBogey5d.hidden=YES;
    }
    else
    {
        trainBogey5a.hidden=NO;
        trainBogey5b.hidden=NO;
        trainBogey5c.hidden=NO;
        trainBogey5d.hidden=NO;
    }
}

-(void)getNumbersInPlace
{
    
    //TRAIN AT PLATFORM 1
    
    NSLog(@"Inside getNumbersInPlace");
    UIImage *numbersSprite = [UIImage imageNamed:@"sprite1.png"];
    
    oneImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 8, 36, 47));
    twoImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 60, 36, 47));
    threeImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 114, 36, 47));
    fourImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 164, 36, 47));
    fiveImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 218, 36, 47));
    sixImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 274, 36, 47));
    sevenImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 326, 36, 47));
    eightImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 377, 36, 47));
    nineImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 431, 36, 47));
    zeroImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 483, 36, 47));
    qMark = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(11, 536, 36, 47));
    cMark = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(15, 588, 30, 47));
    
    oneView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:oneImage]];
    [self.view addSubview: oneView];
    twoView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:twoImage]];
    [self.view addSubview: twoView];
    threeView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:threeImage]];
    [self.view addSubview: threeView];
    fourView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:fourImage]];
    [self.view addSubview: fourView];
    fiveView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:fiveImage]];
    [self.view addSubview: fiveView];
    qMarkView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:qMark]];
    [self.view addSubview: qMarkView];
    cMarkView = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:cMark]];
    [self.view addSubview: cMarkView];
    
    oneView.hidden=YES;
    twoView.hidden = YES;
    threeView.hidden = YES;
    fourView.hidden = YES;
    fiveView.hidden = YES;
    qMarkView.hidden = YES;
    cMarkView.hidden = YES;
    
    //TRAIN AT PLATFORM 2
    
    oneView2 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:oneImage]];
    [self.view addSubview: oneView2];
    threeView2 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:threeImage]];
    [self.view addSubview: threeView2];
    fiveView2 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:fiveImage]];
    [self.view addSubview: fiveView2];
    sevenView2 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:sevenImage]];
    [self.view addSubview: sevenView2];
    nineView2 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:nineImage]];
    [self.view addSubview: nineView2];
    qMarkView2 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:qMark]];
    [self.view addSubview: qMarkView2];
    cMarkView2 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:cMark]];
    [self.view addSubview: cMarkView2];

    
    oneView2.hidden=YES;
    threeView2.hidden = YES;
    fiveView2.hidden = YES;
    sevenView2.hidden = YES;
    nineView2.hidden = YES;
    qMarkView2.hidden = YES;
    cMarkView2.hidden = YES;
    
    //TRAIN AT PLATFORM 3
    
    oneView3 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:oneImage]];
    [self.view addSubview: oneView3];
    twoView3 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:twoImage]];
    [self.view addSubview: twoView3];
    threeView3 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:threeImage]];
    [self.view addSubview: threeView3];
    fiveView3 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:fiveImage]];
    [self.view addSubview: fiveView3];
    eightView3 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:eightImage]];
    [self.view addSubview: eightView3];
    qMarkView3 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:qMark]];
    [self.view addSubview: qMarkView3];
    cMarkView3 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:cMark]];
    [self.view addSubview: cMarkView3];

    
    oneView3.hidden=YES;
    twoView3.hidden=YES;
    threeView3.hidden=YES;
    fiveView3.hidden=YES;
    eightView3.hidden=YES;
    qMarkView3.hidden=YES;
    cMarkView3.hidden=YES;
    
    //TRAIN AT PLATFORM 1 (Train 4)
    oneView4a = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:oneImage]];
    [self.view addSubview: oneView4a];
    oneView4b = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:oneImage]];
    [self.view addSubview: oneView4b];
    twoView4a = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:twoImage]];
    [self.view addSubview: twoView4a];
    twoView4b = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:twoImage]];
    [self.view addSubview: twoView4b];
    threeView4a = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:threeImage]];
    [self.view addSubview: threeView4a];
    qMarkView4 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:qMark]];
    [self.view addSubview: qMarkView4];
    cMarkView4 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:cMark]];
    [self.view addSubview: cMarkView4];

    
    oneView4a.hidden=YES;
    oneView4b.hidden=YES;
    twoView4a.hidden=YES;
    twoView4b.hidden=YES;
    threeView4a.hidden=YES;
    qMarkView4.hidden=YES;
    cMarkView4.hidden=YES;
    
    
    //TRAIN AT PLATFORM 2 (Train 5)
    zeroView5 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:zeroImage]];
    [self.view addSubview: zeroView5];
    twoView5 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:twoImage]];
    [self.view addSubview: twoView5];
    fourView5 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:fourImage]];
    [self.view addSubview: fourView5];
    sixView5 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:sixImage]];
    [self.view addSubview: sixView5];
    eightView5 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:eightImage]];
    [self.view addSubview: eightView5];
    qMarkView5 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:qMark]];
    [self.view addSubview: qMarkView5];
    cMarkView5 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:cMark]];
    [self.view addSubview: cMarkView5];

    
    zeroView5.hidden=YES;
    twoView5.hidden=YES;
    fourView5.hidden=YES;
    sixView5.hidden=YES;
    eightView5.hidden=YES;
    qMarkView5.hidden=YES;
    cMarkView5.hidden=YES;
}


-(void)getNumPadInPlace
{
    UIImage *numbersSprite = [UIImage imageNamed:@"sprite2.jpg"];
    
    oneImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 16, 51, 45));
    twoImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 70, 51, 45));
    threeImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 121, 51, 45));
    fourImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 174, 51, 45));
    fiveImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 227, 51, 45));
    sixImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 280, 51, 45));
    sevenImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 334, 51, 45));
    eightImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 388, 51, 45));
    nineImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 441, 51, 45));
    zeroImage = CGImageCreateWithImageInRect([numbersSprite CGImage], CGRectMake(4, 494, 51, 45));
    
    num1.image = [UIImage imageWithCGImage:oneImage];
    num2.image = [UIImage imageWithCGImage:twoImage];
    num3.image = [UIImage imageWithCGImage:threeImage];
    num4.image = [UIImage imageWithCGImage:fourImage];
    num5.image = [UIImage imageWithCGImage:fiveImage];
    num6.image = [UIImage imageWithCGImage:sixImage];
    num7.image = [UIImage imageWithCGImage:sevenImage];
    num8.image = [UIImage imageWithCGImage:eightImage];
    num9.image = [UIImage imageWithCGImage:nineImage];
    num0.image = [UIImage imageWithCGImage:zeroImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
