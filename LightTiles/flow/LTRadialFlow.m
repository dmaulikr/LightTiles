//
//  LTRadialFlow.m
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTRadialFlow.h"
#import "LTLinearFlow.h"

@implementation LTRadialFlow

#pragma mark - Initialization
- (id)initWithParent:(LTFlow *)parentFlow andDirection:(LTFlowDirection)direction {

    self = [super initWithParent:parentFlow andDirection:direction];
    return self;
}

+ (id)flowWithParent:(LTFlow *)parentFlow andDirection:(LTFlowDirection)direction {
    return [[LTRadialFlow alloc] initWithParent:parentFlow andDirection:direction];
}

#pragma mark - Flow
- (void)generateSubflows {
    // add additional flow in the current direction and in the orthogonal directions
    LTFlow *flow = [LTRadialFlow flowWithParent:self andDirection:self.direction];
    LTFlow *rFlow = [LTLinearFlow flowWithParent:self andDirection:[LTFlow directionRightOrthogonal:self.direction]];
    LTFlow *lFlow = [LTLinearFlow flowWithParent:self andDirection:[LTFlow directionLeftOrthogonal:self.direction]];
    NSMutableSet *subflows = [NSMutableSet setWithCapacity:3];
    if ([self shouldFlowAtLocation:flow.location]) { [subflows addObject:flow]; }
    if ([self shouldFlowAtLocation:rFlow.location]) { [subflows addObject:rFlow]; }
    if ([self shouldFlowAtLocation:lFlow.location]) { [subflows addObject:lFlow]; }
    self.subflows = subflows;
}

@end
