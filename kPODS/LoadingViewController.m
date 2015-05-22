//
//  LoadingViewController.m
//  kPODS
//
//  Created by Devel on 11/16/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "LoadingViewController.h"
#import "AppDelegate.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

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
    _returned = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    if([(AppDelegate*)[[UIApplication sharedApplication] delegate] hasLaunchedOnce] || _returned){
        [self performSegueWithIdentifier:@"launchApp" sender:self];
    } else {
        [self performSegueWithIdentifier:@"launchHelp" sender:self];
        _returned = true;
    }
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

@end
