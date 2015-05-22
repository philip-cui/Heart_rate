//
//  AppDelegate.m
//  kPODS
//
//  Created by Philip on 10/18/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate

@synthesize window;
@synthesize account;
@synthesize data;
@synthesize camera;
@synthesize pulse;
@synthesize oxy;

#pragma mark -
#pragma mark Application lifecycle


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    /*self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];*/
    [Parse setApplicationId:@"sbLvdLnn5Xc0EPBZd30xbndnKNvEyM5N2pKEMaxU"
                  clientKey:@"cC3NEulzRWEycPNgTDY4pLxrEciO4ueQyLBe1Fm6"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    account = [[AccountManagement alloc] init];
    data = [[DataStorage alloc] init];
    camera = [[Camera alloc] init];
    pulse = [[HeartRate alloc] init];
    oxy = [[BloodOxygen alloc] init];
    [data addEntry:0 :0];
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor darkGrayColor];
    pageControl.backgroundColor = [UIColor whiteColor];
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"]){
        _hasLaunchedOnceVal = true;
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        _hasLaunchedOnceVal = false;
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) changeToProfile:(UITabBarController*)tabBarController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:Nil];
    _profile = [storyboard instantiateViewControllerWithIdentifier:@"Profile"];
    _profile.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Profile" image:[UIImage imageNamed:@"profile"] tag:3];
    _tabs = [[NSMutableArray alloc ] initWithArray:tabBarController.viewControllers];
    [_tabs replaceObjectAtIndex:3 withObject:_profile];
    [tabBarController setViewControllers:_tabs animated:YES];
}

- (void) changeToLogin:(UITabBarController*)tabBarController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:Nil];
    _login = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
    _login.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Login" image:[UIImage imageNamed:@"login"] tag:3];
    _tabs = [[NSMutableArray alloc ] initWithArray:tabBarController.viewControllers];
    [_tabs replaceObjectAtIndex:3 withObject:_login];
    [tabBarController setViewControllers:_tabs animated:YES];
}

- (BOOL) tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return !((viewController == [tabBarController.viewControllers objectAtIndex:2])&&[data isEmpty]);
}

- (BOOL) hasLaunchedOnce {
    return _hasLaunchedOnceVal;
}

#pragma mark -
#pragma mark Memory management



- (void)dealloc {
    /* commented out for ARC
    [viewController release];
    [window release];
    [super dealloc];
     */
}


@end