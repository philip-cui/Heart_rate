//
//  HeartRateViewController.m//  kPODS
//
//  Created by Devon Louie on 2014-10-25.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

//we begin monitoring from the camera

#import "HeartRateViewController.h"
#import "SendToGraph.h"
#import "RGBtoHSV.h"
#import "HeartRateCalculation.h"
#include "time.h"

@interface HeartRateViewController()

@end

@implementation HeartRateViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // start capturing frames
    session = [[AVCaptureSession alloc] init];
    
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
    AVCaptureDevice* camera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    // turn on the torch!
    if([camera isTorchModeSupported:AVCaptureTorchModeOn]) {
        [camera lockForConfiguration:nil];
        camera.torchMode=AVCaptureTorchModeOn;
        // may need to mess with exposure
        [camera unlockForConfiguration];
    }
    
    
    // Create a AVCaptureInput with the camera device
    NSError *error=nil;
    AVCaptureInput* cameraInput = [[AVCaptureDeviceInput alloc] initWithDevice:camera error:&error];
    if (cameraInput == nil) {
        NSLog(@"Error to create camera capture:%@",error);
    }
    
    // set the output
    AVCaptureVideoDataOutput* videoOutput = [[AVCaptureVideoDataOutput alloc] init];
    
    // create a queue to run the capture on
    dispatch_queue_t captureQueue=dispatch_queue_create("catpureQueue", NULL);
    
    // setup  delegate
    [videoOutput setSampleBufferDelegate:self queue:captureQueue];
    
    // configure the pixel format
    videoOutput.videoSettings = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA], (id)kCVPixelBufferPixelFormatTypeKey,
                                 nil];
    videoOutput.minFrameDuration=CMTimeMake(1, 10);
    // configure size & duration of the frames we want
    [session setSessionPreset:AVCaptureSessionPresetLow];
    
    // add the input 	and output
    [session addInput:cameraInput];
    [session addOutput:videoOutput];
    
    // Start the session
    [session startRunning];
}



- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    time_t startTime;
    time_t endTime;
    time(&startTime);
    static int count=0;
    count++;
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
    
    // simple highpass and lowpass filter
    static float lastH=0;
    float highPassValue=h-lastH;
    lastH=h;
    float lastHighPassValue=0;
    float lowPassValue=(lastHighPassValue+highPassValue)/2;
    lastHighPassValue=highPassValue;
    int bpm = heartRateCalculation(lowPassValue, count-1);
    if (count == 100){
        time(&endTime);
        bpm = bpm/endTime;
    }
    // send the point to the graph to be displayed
    /* commented out for ARC
     NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
     */
    
    //[Graph performSelectorOnMainThread:@selector(addPoint:) withObject:[NSNumber numberWithFloat:lowPassValue] waitUntilDone:NO];
    
    /* Commented our for ARC
     [pool release];
     */
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
