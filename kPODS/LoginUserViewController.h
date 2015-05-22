//
//  LoginUserViewController.h
//  kPODS
//
//  Created by Philip on 11/9/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginUserViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

- (void) loginReturned:(NSError*)error;
- (BOOL) textFieldShouldReturn:(UITextField *)textField;
- (IBAction)loginButton:(id)sender;
- (IBAction)clickedBackground:(id)sender;

@end
