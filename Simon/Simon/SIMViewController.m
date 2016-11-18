//
//  SIMViewController.m
//  Simon
//
//  Created by Divyendu Singh on 13/12/13.
//  Copyright (c) 2013 Divu. All rights reserved.
//

#import "SIMViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SIMViewController ()
@property (nonatomic, strong) AVAudioPlayer *Audio;
@end

@implementation SIMViewController

-(void)enabledToggle
{
    if(enabledToggle == 0)
    {
        yellow.enabled = NO;
        red.enabled = NO;
        blue.enabled = NO;
        green.enabled = NO;
    }
    else
    {
        yellow.enabled = YES;
        red.enabled = YES;
        blue.enabled = YES;
        green.enabled = YES;
    }
    
    [yellow setImage:[UIImage imageNamed:@"yellow.png"] forState:UIControlStateDisabled];
    [red setImage:[UIImage imageNamed:@"red.png"] forState:UIControlStateDisabled];
    [blue setImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateDisabled];
    [green setImage:[UIImage imageNamed:@"green.png"] forState:UIControlStateDisabled];
}

-(void)endGame
{
    
    if(scoreNumber > highscoreNumber)
    {
        highscoreNumber = scoreNumber;
        [[NSUserDefaults standardUserDefaults]setInteger:highscoreNumber forKey:@"highscoreSaved"];
    }
    
    [self viewDidLoad];
    
    yellow.imageView.animationImages =
    [NSArray arrayWithObjects:[UIImage imageNamed:@"yellow_glow.png"],
     [UIImage imageNamed:@"yellow.png"],nil];
    yellow.imageView.animationDuration = 0.5;
    yellow.imageView.animationRepeatCount = 1;
    [yellow.imageView startAnimating];
    
    red.imageView.animationImages =
    [NSArray arrayWithObjects:[UIImage imageNamed:@"red_glow.png"],
     [UIImage imageNamed:@"red.png"],nil];
    red.imageView.animationDuration = 0.5;
    red.imageView.animationRepeatCount = 1;
    [red.imageView startAnimating];
    
    blue.imageView.animationImages =
    [NSArray arrayWithObjects:[UIImage imageNamed:@"blue_glow.png"],
     [UIImage imageNamed:@"blue.png"],nil];
    blue.imageView.animationDuration = 0.5;
    blue.imageView.animationRepeatCount = 1;
    [blue.imageView startAnimating];
    
    green.imageView.animationImages =
    [NSArray arrayWithObjects:[UIImage imageNamed:@"green_glow.png"],
     [UIImage imageNamed:@"green.png"],nil];
    green.imageView.animationDuration = 0.5;
    green.imageView.animationRepeatCount = 1;
    [green.imageView startAnimating];
    
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"end" withExtension:@"aiff"];
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

-(IBAction)yellowClick:(id)sender
{
    if([[memoryArray objectAtIndex:(int)currentPointer] compare:[NSNumber numberWithInteger:1]] == 0)
    {
        currentPointer=currentPointer + 1;
        if((int)currentPointer > ([memoryArray count] - 1))
        {
            gap = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(nextLevel) userInfo:nil repeats:NO];
            //[self nextLevel];
        }
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"1" withExtension:@"aiff"];
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
        
        yellow.imageView.animationImages =
        [NSArray arrayWithObjects:[UIImage imageNamed:@"yellow_glow.png"],
         [UIImage imageNamed:@"yellow.png"],nil];
        yellow.imageView.animationDuration = 0.5;
        yellow.imageView.animationRepeatCount = 1;
        [yellow.imageView startAnimating];
    }
    else
    {
        [self endGame];
    }
}

-(IBAction)redClick:(id)sender
{
    if([[memoryArray objectAtIndex:(int)currentPointer] compare:[NSNumber numberWithInteger:2]] == 0)
    {
        currentPointer=currentPointer + 1;
        if((int)currentPointer > ([memoryArray count] - 1))
        {
            gap = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(nextLevel) userInfo:nil repeats:NO];
            //[self nextLevel];
        }
        
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"2" withExtension:@"aiff"];
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
        
        red.imageView.animationImages =
        [NSArray arrayWithObjects:[UIImage imageNamed:@"red_glow.png"],
         [UIImage imageNamed:@"red.png"],nil];
        red.imageView.animationDuration = 0.5;
        red.imageView.animationRepeatCount = 1;
        [red.imageView startAnimating];
    }
    else
    {
        [self endGame];
    } 
}

-(IBAction)blueClick:(id)sender
{
    if([[memoryArray objectAtIndex:(int)currentPointer] compare:[NSNumber numberWithInteger:3]] == 0)
    {
        currentPointer=currentPointer + 1;
        if((int)currentPointer > ([memoryArray count] - 1))
        {
            gap = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(nextLevel) userInfo:nil repeats:NO];
            //[self nextLevel];
        }
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"3" withExtension:@"aiff"];
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
        
        blue.imageView.animationImages =
        [NSArray arrayWithObjects:[UIImage imageNamed:@"blue_glow.png"],
         [UIImage imageNamed:@"blue.png"],nil];
        blue.imageView.animationDuration = 0.5;
        blue.imageView.animationRepeatCount = 1;
        [blue.imageView startAnimating];
    }
    else
    {
        [self endGame];
    }
}

-(IBAction)greenClick:(id)sender
{
    if([[memoryArray objectAtIndex:(int)currentPointer] compare:[NSNumber numberWithInteger:4]] == 0)
    {
        currentPointer=currentPointer + 1;
        if((int)currentPointer > ([memoryArray count] - 1))
        {
            gap = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(nextLevel) userInfo:nil repeats:NO];
            //[self nextLevel];
        }
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"4" withExtension:@"aiff"];
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
        
        green.imageView.animationImages =
        [NSArray arrayWithObjects:[UIImage imageNamed:@"green_glow.png"],
         [UIImage imageNamed:@"green.png"],nil];
        green.imageView.animationDuration = 0.5;
        green.imageView.animationRepeatCount = 1;
        [green.imageView startAnimating];
    }
    else
    {
        [self endGame];
    }
}

-(void)nextLevel
{
    scoreNumber += 1;
    score.text = [NSString stringWithFormat:@"%i" , scoreNumber];
    
    enabledToggle = 0;
    [self enabledToggle];
    
    currentPointer = 0;
    [self addMemory];
    engine = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(animate) userInfo:nil repeats:YES];
}

-(void)addMemory
{
    int length = [memoryArray count];
    int nextNumber = (arc4random()%4) + 1;
    
    if(length > 0)
    {
        NSNumber *lastNumber = [memoryArray objectAtIndex:(length-1)];
        while ([lastNumber compare:[NSNumber numberWithInteger:nextNumber]] == 0) {
            nextNumber = (arc4random()%4) + 1;
        }
    }

    NSNumber *num = [NSNumber numberWithInteger:nextNumber];

    [memoryArray addObject:num];
}

-(void)animate
{
    static int indexNum = 0;
    NSNumber *aMemory = [memoryArray objectAtIndex:indexNum];
    int count = [memoryArray count];

    if([aMemory compare:[NSNumber numberWithInteger:1]] == 0)
    {
        yellow.imageView.animationImages =
        [NSArray arrayWithObjects:[UIImage imageNamed:@"yellow_glow.png"],
        [UIImage imageNamed:@"yellow.png"],nil];
        yellow.imageView.animationDuration = 0.5;
        yellow.imageView.animationRepeatCount = 1;
        [yellow.imageView startAnimating];
        
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"1" withExtension:@"aiff"];
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
        
    if([aMemory compare:[NSNumber numberWithInteger:2]] == 0)
    {
        red.imageView.animationImages =
        [NSArray arrayWithObjects:[UIImage imageNamed:@"red_glow.png"],
        [UIImage imageNamed:@"red.png"],nil];
        red.imageView.animationDuration = 0.5;
        red.imageView.animationRepeatCount = 1;
        [red.imageView startAnimating];
        
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"2" withExtension:@"aiff"];
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
        
    if([aMemory compare:[NSNumber numberWithInteger:3]] == 0)
    {
        blue.imageView.animationImages =
        [NSArray arrayWithObjects:[UIImage imageNamed:@"blue_glow.png"],
        [UIImage imageNamed:@"blue.png"],nil];
        blue.imageView.animationDuration = 0.5;
        blue.imageView.animationRepeatCount = 1;
        [blue.imageView startAnimating];
        
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"3" withExtension:@"aiff"];
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
        
    if([aMemory compare:[NSNumber numberWithInteger:4]] == 0)
    {
        green.imageView.animationImages =
        [NSArray arrayWithObjects:[UIImage imageNamed:@"green_glow.png"],
        [UIImage imageNamed:@"green.png"],nil];
        green.imageView.animationDuration = 0.5;
        green.imageView.animationRepeatCount = 1;
        [green.imageView startAnimating];
        
        NSURL* url = [[NSBundle mainBundle] URLForResource:@"4" withExtension:@"aiff"];
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
    indexNum++;
    if(indexNum > (count-1))
    {
        indexNum = 0;
        [engine invalidate];
        engine = nil;
        
        enabledToggle = 1;
        [self enabledToggle];
    }
}

-(IBAction)startGame:(id)sender
{
    startGame.hidden = true;
    
    scoreNumber = 0;
    score.text = @"0";
    
    [self nextLevel];
}

- (void)viewDidLoad
{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
    
    NSLog(@"(%f,%f)", screenWidth, screenHeight);
    
    yellow.center = CGPointMake(90 + screenHeight/2 - 72 , screenWidth/2 - 71);
    red.center = CGPointMake(90 + screenHeight/2 + 72 , screenWidth/2 - 71);
    blue.center = CGPointMake(90 + screenHeight/2 + 72 , screenWidth/2 + 36);
    green.center = CGPointMake(90 + screenHeight/2 - 72 , screenWidth/2 + 36);
    
    [super viewDidLoad];
    
    enabledToggle = 0;
    [self enabledToggle];
    
    currentPointer = 0;
    
    startGame.hidden = NO;
    
    highscoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"highscoreSaved"];
    highscore.text = [NSString stringWithFormat:@"%i" , highscoreNumber];
    
    memoryArray = [[NSMutableArray alloc] initWithCapacity:20];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
