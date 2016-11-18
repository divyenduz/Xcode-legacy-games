//
//  BBUGameViewController.m
//  Bubble Bump
//
//  Created by Divyendu Singh on 11/12/13.
//  Copyright (c) 2013 Divu. All rights reserved.
//

#import "BBUGameViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface BBUGameViewController ()
@property (nonatomic, strong) AVAudioPlayer *Audio;
@property (nonatomic, strong) AVAudioPlayer *Audio2;
@property (nonatomic, strong) AVAudioPlayer *BGM;
@end

@implementation BBUGameViewController

-(void)endGame
{
    NSLog(@"%i" , randomColorNumber);
    [bubbleChangeTimer invalidate];
    [engine invalidate];
    
    player.transform = CGAffineTransformMakeRotation(180);
    [player stopAnimating];
    
    [self.Audio stop];
    self.Audio = nil;
    
    [self.BGM stop];
    self.BGM = nil;
    
    [self.Audio2 stop];
    self.Audio2 = nil;
    
    exit.hidden = NO;
    
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
}

-(void)collisionDetection
{
    if(CGRectIntersectsRect(player.frame, bubble1.frame))
    {
        if(randomColorNumber == 1)
        {
            score += 1;
            scoreLabel.text = [NSString stringWithFormat:@"%i" , score];
            
            NSURL* url = [[NSBundle mainBundle] URLForResource:@"bubble" withExtension:@"aiff"];
            NSAssert(url, @"URL is valid.");
            NSError* error = nil;
            self.Audio2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            if(!self.Audio2)
            {
                NSLog(@"Error creating player: %@", error);
            }
            else
            {
                [self.Audio2 play];
            }

        }
        else
        {
            [self endGame];
        }
        
        bubble1.center = CGPointMake(bubble1.center.x, 300);
    }
    
    if(CGRectIntersectsRect(player.frame, bubble2.frame))
    {
        if(randomColorNumber == 2)
        {
            score += 1;
            scoreLabel.text = [NSString stringWithFormat:@"%i" , score];
            
            NSURL* url = [[NSBundle mainBundle] URLForResource:@"bubble" withExtension:@"aiff"];
            NSAssert(url, @"URL is valid.");
            NSError* error = nil;
            self.Audio2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            if(!self.Audio2)
            {
                NSLog(@"Error creating player: %@", error);
            }
            else
            {
                [self.Audio2 play];
            }
        }
        else
        {
            [self endGame];
        }
        
        bubble2.center = CGPointMake(bubble2.center.x, 300);
    }
    
    if(CGRectIntersectsRect(player.frame, bubble3.frame))
    {
        if(randomColorNumber == 3)
        {
            score += 1;
            scoreLabel.text = [NSString stringWithFormat:@"%i" , score];
            
            NSURL* url = [[NSBundle mainBundle] URLForResource:@"bubble" withExtension:@"aiff"];
            NSAssert(url, @"URL is valid.");
            NSError* error = nil;
            self.Audio2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            if(!self.Audio2)
            {
                NSLog(@"Error creating player: %@", error);
            }
            else
            {
                [self.Audio2 play];
            }
        }
        else
        {
            [self endGame];
        }
        
        bubble3.center = CGPointMake(bubble3.center.x, 300);
    }
    
    if(CGRectIntersectsRect(player.frame, bubble4.frame))
    {
        if(randomColorNumber == 4)
        {
            score += 1;
            scoreLabel.text = [NSString stringWithFormat:@"%i" , score];
            
            NSURL* url = [[NSBundle mainBundle] URLForResource:@"bubble" withExtension:@"aiff"];
            NSAssert(url, @"URL is valid.");
            NSError* error = nil;
            self.Audio2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            if(!self.Audio2)
            {
                NSLog(@"Error creating player: %@", error);
            }
            else
            {
                [self.Audio2 play];
            }
        }
        else
        {
            [self endGame];
        }
        
        bubble4.center = CGPointMake(bubble4.center.x, 300);
    }
}

-(void)bubbleMovement
{
    int speed = 1 + score/5;
    
    [self collisionDetection];
    
    int regenerationDistance = 300;
    
    bubble1.center = CGPointMake(bubble1.center.x, bubble1.center.y + speed);
    bubble2.center = CGPointMake(bubble2.center.x, bubble2.center.y + speed);
    bubble3.center = CGPointMake(bubble3.center.x, bubble3.center.y + speed);
    bubble4.center = CGPointMake(bubble4.center.x, bubble4.center.y + speed);
    
    if(bubble1.center.y > 295)
    {
        int randomFactorX = 100 + arc4random() %443;
        int randomFactorY = arc4random() %regenerationDistance;
        bubble1.center = CGPointMake(randomFactorX, 0 - randomFactorY);
    }
    if(bubble2.center.y > 295)
    {
        int randomFactorX = 100 + arc4random() %443;
        int randomFactorY = arc4random() %regenerationDistance;
        bubble2.center = CGPointMake(randomFactorX, 0 - randomFactorY);
    }
    if(bubble3.center.y > 295)
    {
        int randomFactorX = 100 + arc4random() %443;
        int randomFactorY = arc4random() %regenerationDistance;
        bubble3.center = CGPointMake(randomFactorX, 0 - randomFactorY);
    }
    if(bubble4.center.y > 295)
    {
        int randomFactorX = 100 + arc4random() %443;
        int randomFactorY = arc4random() %regenerationDistance;
        bubble4.center = CGPointMake(randomFactorX, 0 - randomFactorY);
    }
    
    player.center = CGPointMake(player.center.x + direction, player.center.y  - vertical);
    if(player.center.x < 100)
        player.center = CGPointMake(100, player.center.y);
    if(player.center.x > 536)
        player.center = CGPointMake(536, player.center.y);
    if(player.center.y > 280)
    {
        player.center = CGPointMake(player.center.x, 280);
        vertical = 0;
        
        if(direction > 0)
        {
            player.animationImages = [NSArray arrayWithObjects:
                                      [UIImage imageNamed:@"playerr1.png"],
                                      [UIImage imageNamed:@"playerr2.png"], nil];
            
            [player startAnimating];
        }
        if(direction < 0)
        {
            player.animationImages = [NSArray arrayWithObjects:
                                      [UIImage imageNamed:@"playerl1.png"],
                                      [UIImage imageNamed:@"playerl2.png"], nil];
            
            [player startAnimating];
        }
    }
}

-(void)initialize
{
    direction = 0;
    score = 0;
    vertical = 0;
    NSDictionary *bubbleColors = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"red",@"1",
                                  @"blue",@"2",
                                  @"green",@"3",
                                  @"yellow",@"4", nil];
    
    randomColorNumber = (arc4random() %4) + 1;

    NSString *randomColorStringNumber = [NSString stringWithFormat:@"%i", randomColorNumber];
    NSString *randomColorStringText = [bubbleColors objectForKey: randomColorStringNumber];
    
    targetColorLabel.text = randomColorStringText;
    targetColorImageView.image = [UIImage imageNamed: randomColorStringText];
    
    exit.hidden = YES;
}

-(void)bubbleChange
{
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"change" withExtension:@"mp3"];
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
    
    NSDictionary *bubbleColors = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"red",@"1",
                                  @"blue",@"2",
                                  @"green",@"3",
                                  @"yellow",@"4", nil];
    
    randomColorNumber = (arc4random() %4) + 1;
    if(randomColorNumber == oldColor)
        randomColorNumber = (arc4random() %4) + 1;
    NSString *randomColorStringNumber = [NSString stringWithFormat:@"%i", randomColorNumber];
    NSString *randomColorStringText = [bubbleColors objectForKey: randomColorStringNumber];
    
    
    targetColorLabel.text = randomColorStringText;
    targetColorImageView.image = [UIImage imageNamed: randomColorStringText];
    
    oldColor = randomColorNumber;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)rightSwipe
{
    NSLog(@"Right Swipe");
    direction = 2;
    
    player.animationImages = [NSArray arrayWithObjects:
                              [UIImage imageNamed:@"playerr1.png"],
                              [UIImage imageNamed:@"playerr2.png"], nil];
    
    [player startAnimating];
}

-(void)leftSwipe
{
    NSLog(@"Left Swipe");
    direction = -2;
    
    player.animationImages = [NSArray arrayWithObjects:
                              [UIImage imageNamed:@"playerl1.png"],
                              [UIImage imageNamed:@"playerl2.png"], nil];
    
    [player startAnimating];
}

-(void)jump
{
    vertical = -1;
}

-(void)upSwipe
{
    NSLog(@"Up Swipe");
    
    vertical = 1;
    jump = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(jump) userInfo:nil repeats:NO];
    
    if(direction > 0)
    {
        [player stopAnimating];
        player.image = [UIImage imageNamed:@"playerjumpright.png"];
    }
    
    if(direction < 0)
    {
        [player stopAnimating];
        player.image = [UIImage imageNamed:@"playerjumpleft.png"];
    }
}

-(void)downSwipe
{
    NSLog(@"Down Swipe");
    direction = 0;
    
    [player stopAnimating];
    player.image = [UIImage imageNamed:@"player.png"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self initialize];
    bubbleChangeTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(bubbleChange) userInfo:nil repeats:YES];
    engine = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(bubbleMovement) userInfo:nil repeats:YES];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe)];
    [rightSwipe setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:rightSwipe];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe)];
    [leftSwipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(upSwipe)];
    [upSwipe setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:upSwipe];
    
    UISwipeGestureRecognizer *downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downSwipe)];
    [downSwipe setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:downSwipe];
    
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
        [self.BGM play];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
