//
//  ChangePasswordViewController.m
//  kPODS
//
//  Created by Devel on 11/29/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "AccountManagement.h"
#import "AppDelegate.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    _success = false;
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

- (IBAction)save:(id)sender {
    if([[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] checkPassword:_currentPassword.text]){
        if([_password.text isEqualToString:_confirmPassword.text]){
            [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] changePassword:_password.text];
            _success = true;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your password has been updated" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passwords do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Current password incorrect" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(_success){
        [self dismissViewControllerAnimated:YES completion:Nil];
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    if([textField isEqual:_confirmPassword]){
        [textField resignFirstResponder];
        [self save:self];
    } else if([textField isEqual:_password]){
        [_confirmPassword becomeFirstResponder];
    } else {
        [_password becomeFirstResponder];
    }
    return YES;
}
@end
