//
//  ALSOption.m
//  Alpha Speed
//
//  Created by @divyenduz on 06/10/14.
//  Copyright (c) 2014 Divu. All rights reserved.
//

#import "ALSOption.h"

@interface ALSOption ()

@end

@implementation ALSOption

-(IBAction)saveAction:(id)sender{
    [[NSUserDefaults standardUserDefaults]setValue:[nameText text] forKey:@"savedName"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    nameLabel.font = [UIFont fontWithName:@"linowrite" size:14];
    nameString=[[NSUserDefaults standardUserDefaults] stringForKey:@"savedName"];
    
    NSLog(@"String:- %@",nameString);
    if(nameString!=nil){
        nameText.text=[NSString stringWithFormat:@"%@",nameString];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
