//
//  RegisterUserViewController.m
//  kPODS
//
//  Created by Philip on 11/9/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "RegisterUserViewController.h"
#import "AppDelegate.h"

@interface RegisterUserViewController ()

@end

@implementation RegisterUserViewController

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
    [_emailField setDelegate:self];
    [_usernameField setDelegate:self];
    [_passwordField setDelegate:self];
    [_reEnterPasswordField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerUser:(id)sender {
    [_usernameField resignFirstResponder];
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
    [self checkFieldsComplete];
}

- (IBAction)clickedBackground:(id)sender {
    [self.view endEditing:YES];
}


//check whether all the fields are completed or not
- (void) checkFieldsComplete {
    if ([_usernameField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"you must complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
    }
    else {
        [self checkPasswordsMatch];
    }
}

- (void) checkPasswordsMatch {
    
    //check that the two password fields are identical
    if (![_passwordField.text isEqualToString:_reEnterPasswordField.text]){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"password don't match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
    }
    else{
        [self registerNewUser];
    }
}

- (void) registerNewUser {
    [_spinner startAnimating];
    [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] registerUser:_emailField.text :_usernameField.text :_passwordField.text :self];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.parentViewController viewWillAppear:TRUE];
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if([[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] isLoggedIn]){
        [self dismissViewControllerAnimated:YES completion:Nil];
    }
}

- (void) registerReturned:(NSError*)error {
    [_spinner stopAnimating];
    if (!error){
        NSLog(@"Registration success!");
        UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Welcome" message:@"You have been sucessfully registered" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [success show];
        _usernameField.text = nil;
        _passwordField.text = nil;
        _reEnterPasswordField.text = nil;
        _emailField.text = nil;
    } else {
        UIAlertView *failure = [[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [failure show];
    }
}

@end
