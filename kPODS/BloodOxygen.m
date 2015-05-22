//
//  BloodOxygen.m
//  kPODS
//
//  Created by Philip on 11/30/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "BloodOxygen.h"

@implementation BloodOxygen

- (id) init {
    if(self = [super init]){
        _SpO2 = 0;
        _xValues = [[NSMutableArray alloc] initWithCapacity:100];
        _yValues = [[NSMutableArray alloc] initWithCapacity:100];
        _zValues = [[NSMutableArray alloc] initWithCapacity:100];

    }
    return self;
}

- (void) bloodOxygen:(float) r :(float) g :(float) b{
    //normalize RGB values
    float normalizedR = r/255.0f;
    float normalizedG = g/255.0f;
    float normalizedB = b/255.0f;
    
    //Convert to XYZ assuming we are using AppleRGB with D65 luminant
    float x = normalizedR*0.4497288+normalizedG*0.3162486+normalizedB*0.1844926;
    float y = normalizedR*0.2446525+normalizedG*0.6720283+normalizedB*0.0833192;
    float z = normalizedR*0.0251848+normalizedG*0.1411824+normalizedB*0.9224628;
    
    [_xValues addObject:[NSNumber numberWithFloat:x]];
    [_yValues addObject:[NSNumber numberWithFloat:y]];
    [_zValues addObject:[NSNumber numberWithFloat:z]];
}

- (int) getBloodOxygen {
    double averageX;
    double averageY;
    double averageZ;
    double tempX = 0, tempY = 0, tempZ = 0;
    
    //find the average XYZ values
    for(int i = 0; i < [_xValues count];++i){
        tempX += [[_xValues objectAtIndex:i] floatValue];
        tempY += [[_zValues objectAtIndex:i] floatValue];
        tempZ += [[_zValues objectAtIndex:i] floatValue];
    }
    averageX = tempX/((float)[_xValues count]);
    averageY = tempY/((float)[_yValues count]);
    averageZ = tempZ/((float)[_zValues count]);
    
    //find the ammount of 660nm wavelength and 830nm wavelength in the signal
    double hb = 0.001762465*averageX + 0.000705386*averageY;
    double hbo2 = 0.1707914*averageX + 0.06671045*averageY;
    [_xValues removeAllObjects];
    [_yValues removeAllObjects];
    [_zValues removeAllObjects];
    //return SpO2 value
    return round(hbo2/(hbo2+hb)*100);
    
}

@end
