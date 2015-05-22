//
//  Camera.m
//  kPODS
//
//  Created by Philip on 11/29/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "Camera.h"
#import "AppDelegate.h"

@implementation Camera

- (id) init {
    if(self = [super init]){
        
    }
    return self;
}

- (void) start {
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        return;
    }
    @synchronized(self){
        
        // start capturing frames
        _session = [[AVCaptureSession alloc] init];
        
        //get preview
        /*
         session.sessionPreset = AVCaptureSessionPresetMedium;
         CALayer *viewLayer = self.vImagePreview.layer;
         NSLog(@"viewLayer = %@", viewLayer);
         
         AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
         
         captureVideoPreviewLayer.frame = self.vImagePreview.bounds;
         [self.vImagePreview.layer addSublayer:captureVideoPreviewLayer];
         
         AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
         
         NSError *error = nil;
         AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
         if (!input) {
         // Handle the error appropriately.
         NSLog(@"ERROR: trying to open camera: %@", error);
         }
         */
        
        
        // get the default camera device
        _camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        // turn on the torch!
        if([_camera isTorchModeSupported:AVCaptureTorchModeOn]) {
            [_camera lockForConfiguration:nil];
            _camera.torchMode=AVCaptureTorchModeOn;
            [_camera setExposureMode:(AVCaptureExposureModeLocked)];
            [_camera setWhiteBalanceMode:(AVCaptureWhiteBalanceModeLocked)];
            // may need to mess with exposure
            [_camera unlockForConfiguration];
        }
        
        
        
        
        // Create a AVCaptureInput with the camera device
        NSError *error=nil;
        _cameraInput = [[AVCaptureDeviceInput alloc] initWithDevice:_camera error:&error];
        if (_cameraInput == nil) {
            NSLog(@"Error to create camera capture:%@",error);
        }
        
        // set the output
        _videoOutput = [[AVCaptureVideoDataOutput alloc] init];
        
        // create a queue to run the capture on
        dispatch_queue_t captureQueue=dispatch_queue_create("catpureQueue", NULL);
        
        // setup  delegate
        [_videoOutput setSampleBufferDelegate:[(AppDelegate*)[[UIApplication sharedApplication] delegate] pulse] queue:captureQueue];
        
        // configure the pixel format
        _videoOutput.videoSettings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA], (id)kCVPixelBufferPixelFormatTypeKey,nil];
        _videoOutput.minFrameDuration=CMTimeMake(1, 10);
        // configure size & duration of the frames we want
        [_session setSessionPreset:AVCaptureSessionPresetLow];
        
        // add the input 	and output
        [_session addInput:_cameraInput];
        [_session addOutput:_videoOutput];
        [_session startRunning];
    }
}

- (void) stop {
    @synchronized(self){
        if(_session){
            [_session stopRunning];
            /*dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             @synchronized(self){
             [_session stopRunning];
             }
             });*/
        }
    }
}


@end
