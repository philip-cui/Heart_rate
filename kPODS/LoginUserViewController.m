//
//  LoginUserViewController.m
//  kPODS
//
//  Created by Philip on 11/9/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"
#import "LoginUserViewController.h"

@interface LoginUserViewController ()

@end

@implementation LoginUserViewController

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
    [_usernameField setDelegate:self];
    [_passwordField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
//}


- (IBAction)loginButton:(id)sender {
    [_spinner startAnimating];
    [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] loginUser:_usernameField.text :_passwordField.text :self];
}

- (IBAction)clickedBackground:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    if([textField isEqual:_passwordField]){
        [textField resignFirstResponder];
        [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] loginUser:_usernameField.text :_passwordField.text :self];
    } else {
        [_passwordField becomeFirstResponder];
    }
    return YES;
}

- (void) viewWillAppear:(BOOL)animated {
    if([[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] isLoggedIn]){
        [self.tabBarController setSelectedIndex:0];
        [(AppDelegate*)[[UIApplication sharedApplication] delegate] changeToProfile:self.tabBarController];
    }
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if([[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] isLoggedIn]){
        [self.tabBarController setSelectedIndex:0];
        [(AppDelegate*)[[UIApplication sharedApplication] delegate] changeToProfile:self.tabBarController];
    }
}

- (void) loginReturned:(NSError*)error{
    [_spinner stopAnimating];
    if (!error) {
        NSLog(@"Login user!");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:[@"Welcome back " stringByAppendingString:_usernameField.text] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        _passwordField.text = nil;
        _usernameField.text = nil;
        [self.tabBarController setSelectedIndex:0];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
