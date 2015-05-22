//
//  HeartRate.h
//  kPODS
//
//  Created by Philip on 11/29/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "MeasureViewController.h"

@interface HeartRate : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate>

@property MeasureViewController *callbackController;
@property int count;
@property float bpm;
@property NSMutableArray* heartRateData;
@property bool discardFrames;

- (void) setCallbackController:(MeasureViewController *)callbackController;
- (int) heartRateCalculation:(float) hue :(int)i :(float)bpm;
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;
- (void) reset;
- (void) showAlert;

@end
