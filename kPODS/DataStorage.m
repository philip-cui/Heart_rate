//
//  DataStorage.m
//  kPODS
//
//  Created by Philip on 11/22/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "DataStorage.h"
#import "AppDelegate.h"
#import "AccountManagement.h"

@implementation DataStorage

- (id) init {
    if(self = [super init]){
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
    return [_data count];
}

- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    return [(NSNumber*)[_data objectAtIndex:index][@"pulseRate"] intValue];
}

- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex2:(NSInteger)index {
    return [(NSNumber*)[_data objectAtIndex:index][@"bloodOxygen"] intValue];
}

- (void) addEntry:(NSInteger)bpm :(NSInteger)spo2 {
    PFObject*temp = [PFObject objectWithClassName:@"Data"];
    temp[@"date"] = [NSDate date];
    temp[@"pulseRate"] = [NSNumber numberWithInteger:bpm];
    temp[@"bloodOxygen"] = [NSNumber numberWithInteger:spo2];
    [_data addObject:temp];
    if([[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] isLoggedIn]){
        temp[@"username"] = [[(AppDelegate*)[[UIApplication sharedApplication] delegate] account] getUsername];
        [temp saveInBackground];
    }
}

- (bool) isEmpty {
    return [_data count] < 2;
}

- (void) loadData:(NSArray *)objects :(NSError *)error {
    if(error){
        [self performSelectorOnMainThread:@selector(showErrorAlert:) withObject:error waitUntilDone:false];
    } else {
        _data = [[NSMutableArray alloc] initWithArray:objects];
    }
}

- (void) showErrorAlert :(NSError*)error {
    UIAlertView *hAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error userInfo][@"error"]delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [hAlert show];
}

- (void) clearData {
    _data = [[NSMutableArray alloc] init];
    PFObject*temp = [PFObject objectWithClassName:@"Data"];
    temp[@"date"] = [NSDate date];
    temp[@"pulseRate"] = [NSNumber numberWithInteger:0];
    temp[@"bloodOxygen"] = [NSNumber numberWithInteger:0];
}

@end
