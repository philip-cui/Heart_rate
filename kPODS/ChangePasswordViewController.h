//
//  ChangePasswordViewController.h
//  kPODS
//
//  Created by Devel on 11/29/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController <UIAlertViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *currentPassword;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property bool success;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
