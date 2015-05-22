//
//  DataStorage.h
//  kPODS
//
//  Created by Philip on 11/22/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BEMSimpleLineGraph/BEMSimpleLineGraphView.h"
#import <Parse/Parse.h>

@interface DataStorage : NSObject <BEMSimpleLineGraphDataSource>

@property NSMutableArray *data;

- (NSInteger) numberOfPointsInLineGraph:(BEMSimpleLineGraphView*)graph;
- (CGFloat)lineGraph:(BEMSimpleLineGraphView*)graph valueForPointAtIndex:(NSInteger)index;
- (void) addEntry:(NSInteger)bpm :(NSInteger)spo2;
- (bool) isEmpty;
- (void) loadData:(NSArray*)objects :(NSError*)error;
- (void) showErrorAlert :(NSError*)error;
- (void) clearData;

@end
