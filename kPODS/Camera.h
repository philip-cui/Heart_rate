//
//  Camera.h
//  kPODS
//
//  Created by Philip on 11/29/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Camera : NSObject

@property AVCaptureSession *session;
@property AVCaptureDevice *camera;
@property AVCaptureInput *cameraInput;
@property AVCaptureVideoDataOutput *videoOutput;

- (void) start;
- (void) stop;


@end
