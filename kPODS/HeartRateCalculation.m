//
//  HeartRateCalculation.m
//  kPODS
//
//  Created by Devon Louie on 2014-11-23.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeartRateCalculation.h"

int heartRateCalculation(float hue, int i) {
    double heartRateData[100];
    int bpm = 0;
    bool lastPositive = TRUE;
    float average = 0;
    heartRateData[i] = hue;
    if (i == 100){
        for (int x = 0; x <100; x++){
            average += heartRateData[x];
        }
        for (int x =0; x <100; x++){
            heartRateData[x] = heartRateData[x] - average;
        }
        for (int x =1; x<100; x++){
            for (int x =1; x<100; x++){
                if (heartRateData[0] > 0 ){
                    lastPositive = TRUE;
                }
                else if (heartRateData[0] < 0){
                    lastPositive = FALSE;
                }
                if (heartRateData[x] > 0){
                    if (lastPositive == FALSE){
                        bpm++;
                    }
                    lastPositive = TRUE;
                }
                else if (heartRateData[x] < 0){
                    if (lastPositive == TRUE){
                        bpm++;
                    }
                    lastPositive = FALSE;
                }
            }
            bpm = bpm / 2;
        }
    }
    return bpm;
}
