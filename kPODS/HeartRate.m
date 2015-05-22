//
//  HeartRate.m
//  kPODS
//
//  Created by Philip on 11/29/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "HeartRate.h"
#import "RGBtoHSV.h"
#import "DataStorage.h"
#import "AppDelegate.h"
#include <time.h>

time_t startTime;
time_t endTime;
bool throwAwayFlag;

@implementation HeartRate

- (id) init {
    if(self = [super init]){
        _count = 0;
        _bpm = 0;
        _heartRateData = [[NSMutableArray alloc] initWithCapacity:100];
        _discardFrames = false;
    }
    return self;
}

- (void) setCallback: (MeasureViewController*)controler {
    _callbackController = controler;
}

- (int) heartRateCalculation:(float)hue :(int)i :(float)bpm {
    //NSLog(@"Inside heartRateCalculation");
    bool lastPositive = TRUE;
    float average = 0;
    [_heartRateData addObject:[NSNumber numberWithFloat:hue]];
    NSLog(@"    heartRateData[%d] is: %f", i, [[_heartRateData objectAtIndex:i] floatValue]);
    if (i == 199){
        //NSLog(@"Inside if(i==99)");
        for (int x = 0; x <200; x++){
            average = average + [[_heartRateData objectAtIndex:x] floatValue];
           // NSLog(@"The value of average is: %f",average);
        }
        average = average/200;
        for (int x =0; x <200; x++){
            [_heartRateData replaceObjectAtIndex:x withObject:[NSNumber numberWithFloat:[[_heartRateData objectAtIndex:x] floatValue] - average]];
        }
        for (int x =0; x<200; x++){
            if ([[_heartRateData objectAtIndex:0] floatValue] > 0 ){
                lastPositive = TRUE;
            }
            else if ([[_heartRateData objectAtIndex:0] floatValue]  < 0){
                lastPositive = FALSE;
            }
            if ([[_heartRateData objectAtIndex:x] floatValue]  > 0){
                if (lastPositive == FALSE && ([[_heartRateData objectAtIndex:x] floatValue]>0.22 || [[_heartRateData objectAtIndex:x] floatValue]<-0.22)){
                    bpm++;
                }
                lastPositive = TRUE;
            }
            else if ([[_heartRateData objectAtIndex:x] floatValue]  < 0){
                if (lastPositive == TRUE && ([[_heartRateData objectAtIndex:x] floatValue]>0.22 || [[_heartRateData objectAtIndex:x] floatValue]<-0.22)){
                    bpm++;
                }
                lastPositive = FALSE;
            }
            /*if (([[_heartRateData objectAtIndex:x] floatValue]-[[_heartRateData objectAtIndex:x-3] floatValue]) > 0.4 || ([[_heartRateData objectAtIndex:x] floatValue]-[[_heartRateData objectAtIndex:x-3] floatValue]) < -0.4){
                bpm ++;
            }*/
        }
        bpm = bpm / 2;
        NSLog(@"The value of BPM is %f", bpm);
    }
    return bpm;
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    if(_discardFrames){
        return;
    }
    if (_count == 0){
        sleep(1);
        time(&startTime);
    }
    _count++;
    if(_count > 200){
        return;
    }
    if (throwAwayFlag == FALSE && _count == 40){
        _count = 1;
        throwAwayFlag = TRUE;
        time(&startTime);
    }
    
    // only run if not already processing an image
    // this is the image buffer
    CVImageBufferRef cvimgRef = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the image buffer
    CVPixelBufferLockBaseAddress(cvimgRef,0);
    // access the data lose data precision for whatever reason
    int width=CVPixelBufferGetWidth(cvimgRef);
    int height=CVPixelBufferGetHeight(cvimgRef);
    // get the raw image bytes
    uint8_t *buf=(uint8_t *) CVPixelBufferGetBaseAddress(cvimgRef);
    size_t bprow=CVPixelBufferGetBytesPerRow(cvimgRef);
    float r=0,g=0,b=0;
    for(int y=0; y<height; y++) {
        for(int x=0; x<width*4; x+=4) {
            b+=buf[x];
            g+=buf[x+1];
            r+=buf[x+2];
            //			a+=buf[x+3];
        }
        buf+=bprow;
    }
    r/=255*(float) (width*height);
    g/=255*(float) (width*height);
    b/=255*(float) (width*height);
    
    float h,s,v;
    
    RGBtoHSV(r, g, b, &h, &s, &v); //convert!
    
    NSLog(@"The value of hue is: %f", h);
    if(h > 50 || h < 20){
        _discardFrames = true;
        [self performSelectorOnMainThread:@selector(showAlert) withObject:Nil waitUntilDone:false];
        _count = 0;
        [_heartRateData removeAllObjects];
    }
    
    NSLog(@"    Count is: %d", _count);
    if (!(h > 50 || h <20)){
        _bpm = [self heartRateCalculation:h:_count-1:_bpm];
        [[(AppDelegate*)[[UIApplication sharedApplication] delegate] oxy] bloodOxygen:r :g :b ];
        if (_count == 200){
            time(&endTime);
            NSLog(@"The difftime is: %f", difftime(endTime, startTime));
            _bpm = (60.000*(_bpm/difftime(endTime, startTime)));
            [_heartRateData removeAllObjects];
            [[(AppDelegate*)[[UIApplication sharedApplication] delegate] data] addEntry:_bpm : [[(AppDelegate*)[[UIApplication sharedApplication] delegate] oxy] getBloodOxygen]];
            [_callbackController heartRateCallback];
            NSLog(@"BPM is: %f",_bpm);
            _bpm = 0;
            _count = 0;
            throwAwayFlag = FALSE;
        }
    }
    //NSLog(@"BPM is: %d",_bpm);
}

- (void) reset {
    _discardFrames = false;
}

- (void) showAlert {
    UIAlertView *hAlert = [[UIAlertView alloc] initWithTitle:@"Place finger in front of camera" message:@"I cannot measure your heart rate if you finger is not in front of the camera" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [hAlert show];
}

@end
