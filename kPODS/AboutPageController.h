//
//  AboutPageController.h
//  kPODS
//
//  Created by Philip on 11/9/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutPageController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
- (IBAction)displayHelp:(id)sender;

@end
