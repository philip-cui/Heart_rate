//
//  BloodOxygen.h
//  kPODS
//
//  Created by Philip on 11/30/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BloodOxygen : NSObject

@property float SpO2;
@property NSMutableArray *xValues;
@property NSMutableArray *yValues;
@property NSMutableArray *zValues;

- (void) bloodOxygen:(float) r :(float) g :(float) b;
- (int) getBloodOxygen;
@end
