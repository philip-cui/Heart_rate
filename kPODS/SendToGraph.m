//
//  SendToGraph.m
//  kPODS
//
//  Created by Devon Louie on 2014-10-23.
//  Copyright (c) 2014 kPODS. All rights reserved.
//

// Gives us a graph from the given data. Will need to analyze the graph at a later point

#import "SendToGraph.h"


@implementation Graph

@synthesize points;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    if(points.count==0) return;
    // Drawing code.
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 1);
    CGContextBeginPath(context);
    float xpos=self.bounds.size.width;
    float ypos=[[points objectAtIndex:0] floatValue];
    CGContextMoveToPoint(context, xpos, ypos);
    for(int i=1; i<points.count; i++) {
        xpos-=2;
        float ypos=[[points objectAtIndex:i] floatValue];
        CGContextAddLineToPoint(context, xpos, self.bounds.size.height/2+ypos*self.bounds.size.height/2);
    }
    CGContextStrokePath(context);
}

-(void) addPoint:(NSNumber *) newPoint {
    if(!points) points=[[NSMutableArray alloc] init];
    [points insertObject:newPoint atIndex:0];
    while(points.count>self.bounds.size.width/2) {
        [points removeLastObject];
    }
    [self setNeedsDisplay];
}

//need to release points

/*
- (void)dealloc {
    self.points = nil;
    
    [super dealloc];
}
*/

@end

