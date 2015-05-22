//
//  HelpPageViewController.h
//  kPODS
//
//  Created by Devel on 11/22/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpPageViewController : UIViewController
@property NSUInteger pageNumber;
@property NSUInteger totalPages;
@property NSString* textContent;
@property NSString* imageContent;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@property (weak, nonatomic) IBOutlet UIButton *exitButton;
- (IBAction)exit:(id)sender;

@end
