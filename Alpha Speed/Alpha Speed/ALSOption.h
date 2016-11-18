//
//  ALSOption.h
//  Alpha Speed
//
//  Created by @divyenduz on 06/10/14.
//  Copyright (c) 2014 Divu. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *nameString;
@interface ALSOption : UIViewController
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UITextField *nameText;
    
    IBOutlet UIButton *saveButton;
}

-(IBAction)saveAction:(id)sender;
@end
