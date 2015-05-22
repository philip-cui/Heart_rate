//
//  DataEntry.h
//  kPODS
//
//  Created by Devel on 11/28/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataEntry : NSObject

@property NSDate *date;
@property NSInteger pulseRate;
@property NSInteger bloodOxyen;

- (NSString*) getDateStr;

@end
