//
//  LTLinearFlow.m
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTLinearFlow.h"

@implementation LTLinearFlow

#pragma mark - Initialization
- (id)initWithParent:(LTFlow *)parentFlow andDirection:(LTFlowDirection)direction {

    self = [super initWithParent:parentFlow andDirection:direction];
    return self;
}

+ (id)flowWithParent:(LTFlow *)parentFlow andDirection:(LTFlowDirection)direction {
    return [[LTLinearFlow alloc] initWithParent:parentFlow andDirection:direction];
}

#pragma mark - Flow
- (void)generateSubflows {

    // add additional flow in the current direction
    LTFlow *flow = [LTLinearFlow flowWithParent:self andDirection:self.direction];

    if ([self shouldFlowAtLocation:flow.location]) {
        self.subflows = [NSSet setWithObjects:flow, nil];
    }
}

@end
