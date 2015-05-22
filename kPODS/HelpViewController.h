//
//  HelpViewController.h
//  kPODS
//
//  Created by Devel on 11/22/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelpPageViewController.h"

@interface HelpViewController : UIViewController <UIPageViewControllerDataSource>


@property UIPageViewController *pageViewController;
@property NSArray *pageContents;
@property NSArray *pageImages;

- (HelpPageViewController *)viewControllerAtIndex:(NSUInteger)index;

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController;

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController;

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController;

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController;

@end
