//
//  RGBtoHSV.m
//  kPODS
//
//  Created by Devon Louie on 2014-11-23.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <Foundation/Foundation.h>

// r,g,b values are from 0 to 1 // h = [0,360], s = [0,1], v = [0,1]
//	if s == 0, then h = -1 (undefined)
void RGBtoHSV( float r, float g, float b, float *h, float *s, float *v ) {
    float min, max, delta;
    min = MIN( r, MIN(g, b ));
    max = MAX( r, MAX(g, b ));
    *v = max;
    delta = max - min;
    if( max != 0 )
        *s = delta / max;
    else {
        // r = g = b = 0
        *s = 0;
        *h = -1;
        return;
    }
    if( r == max )
        *h = ( g - b ) / delta;
    else if( g == max )
        *h=2+(b-r)/delta;
    else
        *h=4+(r-g)/delta;
    *h *= 60;
    if( *h < 0 )
        *h += 360;
}