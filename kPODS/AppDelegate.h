//
//  AppDelegate.h
//  kPODS
//
//  Created by Philip on 10/18/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountManagement.h"
#import "DataStorage.h"
#import "ProfileViewController.h"
#import "LoginUserViewController.h"
#import "Camera.h"
#import "HeartRate.h"
#import "BloodOxygen.h"

@interface AppDelegate : NSObject <UIApplicationDelegate,UITabBarControllerDelegate> {
    UIWindow *window;
    AccountManagement *account;
    DataStorage *data;
    Camera*camera;
    HeartRate*pulse;
    BloodOxygen*oxy;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (atomic, retain) AccountManagement* account;
@property (atomic, retain) DataStorage *data;
@property (nonatomic, retain) ProfileViewController *profile;
@property (nonatomic, retain) NSMutableArray *tabs;
@property (atomic, retain) Camera *camera;
@property (atomic, retain) HeartRate *pulse;
@property (atomic, retain) LoginUserViewController*login;
@property (atomic, retain) BloodOxygen *oxy;
@property bool hasLaunchedOnceVal;

- (void) changeToProfile:(UITabBarController*)tabBarController;
- (void) changeToLogin:(UITabBarController *)tabBarController;
- (BOOL) hasLaunchedOnce;

@end