//
//  HearRateViewController.h
//  kPODS
//
//  Created by Devon Louie on 2014-10-25.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HeartRateViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate> {
    AVCaptureSession *session;
}

@end