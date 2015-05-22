//
//  RegisterUserViewController.h
//  kPODS
//
//  Created by Philip on 11/9/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterUserViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

- (void) registerReturned:(NSError*)error;
- (BOOL) textFieldShouldReturn:(UITextField *)textField;
- (IBAction)cancelButton:(id)sender;
- (IBAction)registerUser:(id)sender;
- (IBAction)clickedBackground:(id)sender;


@end
