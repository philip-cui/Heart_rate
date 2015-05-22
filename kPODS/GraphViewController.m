//
//  GraphViewController.m
//  kPODS
//
//  Created by Kevin Ang on 11/20/14.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "GraphViewController.h"
#import "DataStorage.h"
#import "DataEntry.h"
#include "AppDelegate.h"

@interface GraphViewController ()

@end

@implementation GraphViewController

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
    [_graphView setDataSource:[(AppDelegate*)[[UIApplication sharedApplication] delegate] data]];
    [_graphView setDelegate:self];
    _graphView.autoScaleYAxis = YES;
    _graphView.colorBackgroundXaxis = [UIColor whiteColor];
    _graphView.alwaysDisplayDots = YES;
    _graphView.enableReferenceAxisFrame = YES;
    _graphView.enablePopUpReport = YES;
    _graphView.enableXAxisLabel = NO;
    //_graphView.alwaysDisplayPopUpLabels = YES;
    /*_graphView.colorTop = [UIColor whiteColor];
    _graphView.colorBottom = [UIColor whiteColor];
    _graphView.colorLine = [UIColor colorWithRed:0 green:122.0/255.0 blue:1.0 alpha:1.0];
    _graphView.colorPoint = [UIColor colorWithRed:0 green:122.0/255.0 blue:1.0 alpha:1.0];
    _graphView.colorTouchInputLine = [UIColor blackColor];*/
    [_graphView setColorTouchInputLine:[UIColor blackColor]];
    _showPopups = false;
    
}

- (void) viewWillAppear:(BOOL)animated {
    [_graphView reloadGraph];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfGapsBetweenLabelsOnLineGraph:(BEMSimpleLineGraphView *)graph {
    return 0;
}

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didTouchGraphWithClosestIndex:(NSInteger)index {

}

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didReleaseTouchFromGraphWithClosestIndex:(CGFloat)index {

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
