//
//  HelpPageViewController.m
//  kPODS
//
//  Created by Devel on 11/22/2014.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import "HelpPageViewController.h"

@interface HelpPageViewController ()

@end

@implementation HelpPageViewController

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
    self.contentLabel.text = self.textContent;
    _contentImage.image = [UIImage imageNamed:_imageContent];
    if(_pageNumber == 4){
        _exitButton.hidden = NO;
    } else {
        _exitButton.hidden = YES;
    }
}

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

- (IBAction)exit:(id)sender {
    //[self.presentedViewController viewWillAppear:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
