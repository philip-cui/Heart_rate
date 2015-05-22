//
//  AccountManagement.h
//  kPODS
//
//  Created by Philip on 11/16/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "RegisterUserViewController.h"
#import "LoginUserViewController.h"
#import "ProfileViewController.h"

@interface AccountManagement : NSObject

@property PFUser* user;

- (BOOL) isLoggedIn;
- (void) loginUser: (NSString*)username :(NSString*)password :(LoginUserViewController*)controller;
- (void) registerUser: (NSString*)email :(NSString*)username :(NSString*)password :(RegisterUserViewController*)controller;
- (NSString*) getUsername;
- (NSString*) getEmail;
- (void) logoutUser;
- (void) changeEmail:(NSString*)email :(ProfileViewController*)profile;
- (void) getData;

@end
