//
//  ProfileViewController.m
//  kPODS
//
//  Created by Kevin Ang on 11/20/14.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
}

- (void) viewWillAppear:(BOOL)animated {
    _usernameLabel.text = [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] getUsername];
    _emailLabel.text = [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] getEmail];
    _emailField.text = [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] getEmail];
    [_emailField setDelegate:self];
    _success = false;
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

- (IBAction)editEmail:(id)sender {
    _emailLabel.hidden = true;
    _emailField.hidden = false;
    _editButton.hidden = true;
    _doneButton.hidden = false;
}

- (IBAction)logOut:(id)sender {
    [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] logoutUser];
    [(AppDelegate*)[[UIApplication sharedApplication] delegate] changeToLogin:self.tabBarController];
}

- (IBAction)dismisKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)doneEditing:(id)sender {
    if([_emailLabel.text isEqualToString:_emailField.text]){
        _emailField.hidden = true;
        _emailLabel.hidden = false;
        _doneButton.hidden = true;
        _editButton.hidden = false;
    } else {
        [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] changeEmail:_emailField.text :self];
        [_spinner startAnimating];
    }
}

- (void) saveCallback:(NSError *)error {
    [_spinner stopAnimating];
    if(error){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"]delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        _success = false;
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Email address changed"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        _success = true;
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self doneEditing:self];
    return YES;
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(_success){
        _emailLabel.text = _emailField.text;
        _emailField.hidden = true;
        _emailLabel.hidden = false;
        _doneButton.hidden = true;
        _editButton.hidden = false;
    }
}

@end
