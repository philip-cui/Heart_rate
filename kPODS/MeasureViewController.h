//
//  MeasureViewController.h
//  kPODS
//
//  Created by Devel on 11/21/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeasureViewController : UIViewController <UIAlertViewDelegate>

- (IBAction)measurePressed:(id)sender;
- (void) heartRateCallback;

@property bool capturing;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
