//
//  GraphViewController.h
//  kPODS
//
//  Created by Kevin Ang on 11/20/14.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMSimpleLineGraph/BEMSimpleLineGraphView.h"

@interface GraphViewController : UIViewController <BEMSimpleLineGraphDelegate>

@property (weak, nonatomic) IBOutlet BEMSimpleLineGraphView *graphView;
@property bool showPopups;

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didTouchGraphWithClosestIndex:(NSInteger)index;
- (void)lineGraph:(BEMSimpleLineGraphView *)graph didReleaseTouchFromGraphWithClosestIndex:(CGFloat)index;
@end