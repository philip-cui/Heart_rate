//
//  AccountManagement.m
//  kPODS
//
//  Created by Philip on 11/16/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "AccountManagement.h"
#import "AppDelegate.h"

@implementation AccountManagement

- (BOOL) isLoggedIn {
    if(_user){
        return true;
    } else {
        return false;
    }
}

- (void) loginUser: (NSString*)username :(NSString*)password :(LoginUserViewController*)controller {
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
        if(!error){
            _user = user;
            [self getData];
        }
        [controller loginReturned:error];
    }];
}

- (void) registerUser: (NSString*)email :(NSString*)username :(NSString*)password :(RegisterUserViewController*)controller{
    NSLog(@"registering....");
    PFUser *newUser = [PFUser user];
    newUser.username = username;
    newUser.email = email;
    newUser.password = password;
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error){
            _user = newUser;
            PFObject *temp = [PFObject objectWithClassName:@"Data"];
            temp[@"username"] = _user.username;
            temp[@"date"] = [NSDate date];
            temp[@"pulseRate"] = [NSNumber numberWithInt:0];
            temp[@"bloodOxygen"] = [NSNumber numberWithInt:0];
            [temp saveInBackgroundWithBlock:^(BOOL succeeded, NSError*error){
                [self getData];
            }];
        }
        [controller registerReturned:error];
    }];
}

- (NSString*) getUsername {
    return _user.username;
}

- (NSString*) getEmail {
    return _user.email;
}

- (void) logoutUser {
    if(_user){
        [PFUser logOut];
        _user = Nil;
        [[(AppDelegate*)[[UIApplication sharedApplication] delegate] data] clearData];
    }
}

- (void) changeEmail:(NSString *)email :(ProfileViewController*)profile {
    if(_user){
        _user.email = email;
        [_user saveInBackgroundWithBlock:^(BOOL succeeded, NSError*error){
            [profile saveCallback:error];
        }];
    }
}

- (void) getData {
    if(_user){
        PFQuery* query = [PFQuery queryWithClassName:@"Data"];
        [query whereKey:@"username" equalTo:_user.username];
        [query orderByAscending:@"date"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError*error){
            [[(AppDelegate*)[[UIApplication sharedApplication] delegate] data] loadData:objects :error];
        }];
    }
}

@end
