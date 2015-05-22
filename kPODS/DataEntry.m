//
//  DataEntry.m
//  kPODS
//
//  Created by Devel on 11/28/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "DataEntry.h"

@implementation DataEntry

- (NSString*) getDateStr {
    return [_date descriptionWithLocale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
}

@end
