//
//  MeasureViewController.m
//  kPODS
//
//  Created by Devel on 11/21/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "MeasureViewController.h"
#import "AppDelegate.h"

@interface MeasureViewController ()

@end

@implementation MeasureViewController

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
    [[(AppDelegate*)[[UIApplication sharedApplication] delegate] pulse]setCallbackController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    _capturing = false;
}

-(void) viewDidDisappear:(BOOL)animated {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        [[(AppDelegate*)[[UIApplication sharedApplication] delegate] camera] stop];
    });
    [_spinner stopAnimating];
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

- (IBAction)measurePressed:(id)sender {
    [_spinner startAnimating];
    [[(AppDelegate*)[[UIApplication sharedApplication] delegate] pulse] reset];
    [[(AppDelegate*)[[UIApplication sharedApplication] delegate] camera] start];
}

- (void) heartRateCallback {
    [_spinner stopAnimating];
    [self.tabBarController setSelectedIndex:2];
}

@end
