//
//  SendToGraph.h
//  kPODS
//
//  Created by Devon Louie on 2014-10-25.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Graph : UIView {
    NSMutableArray *points;
}

@property (nonatomic, retain) NSMutableArray *points;

-(void) addPoint:(NSNumber *) newPoint;

@end
