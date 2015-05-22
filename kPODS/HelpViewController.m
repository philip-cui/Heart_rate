//
//  HelpViewController.m
//  kPODS
//
//  Created by Devel on 11/22/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pageContents = @[@"1. Place and keep your index finger in front of the camera and flash", @"2. Press the measure button and wait for the measurement to complete", @"3. View the result. Afterwards it is possible to take another measurement" , @"4. Sign up or log in to keep track of your results, which can help you track your measurements", @"5. Touch and drag your finger on the graph and you will be able to see more details"];
    _pageImages = @[@"1",@"2",@"3",@"4",@"5"];
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpView"];
    self.pageViewController.dataSource = self;
    HelpPageViewController * initalView = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[initalView];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (HelpPageViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageContents count] == 0) || (index >= [self.pageContents count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    HelpPageViewController *helpPageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpViewContent"];
    helpPageContentViewController.totalPages = [self.pageContents count];
    helpPageContentViewController.textContent = self.pageContents[index];
    helpPageContentViewController.imageContent = self.pageImages[index];
    helpPageContentViewController.pageNumber = index;
    
    return helpPageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((HelpPageViewController*) viewController).pageNumber;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((HelpPageViewController*) viewController).pageNumber;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageContents count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageContents count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
@end
