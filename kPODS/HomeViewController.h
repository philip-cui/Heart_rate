//
//  HomeViewController.h
//  kPODS
//
//  Created by Philip on 11/30/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property NSArray *titles;
@property NSArray *tips;

@end
