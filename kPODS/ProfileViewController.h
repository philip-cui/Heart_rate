//
//  ProfileViewController.h
//  kPODS
//
//  Created by Kevin Ang on 11/20/14.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property bool success;

- (IBAction)doneEditing:(id)sender;
- (IBAction)editEmail:(id)sender;
- (IBAction)logOut:(id)sender;
- (IBAction)dismisKeyboard:(id)sender;
- (void) saveCallback:(NSError*)error;

@end
