//
//  LTSpout.m
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTSpout.h"
#import "LTSource.h"
#import "LTRadialFlow.h"

@implementation LTSpout

#pragma mark - Initialization
- (id)initWithSource:(LTSource *)source andDirection:(LTFlowDirection)direction {

    self = [super init];
    if (self) {
        self.source = source;
        self.direction = direction;
    }
    return self;
}

+ (id)spoutWithSource:(LTSource *)source andDirection:(LTFlowDirection)direction {
    return [[LTSpout alloc] initWithSource:source andDirection:direction];
}

- (void)flow {

    // flow!
    self.primaryFlow = [LTRadialFlow flowWithParent:nil andDirection:self.direction];
    self.primaryFlow.location = [LTFlow locationFromLocation:self.source.locaiton andDirection:self.direction];
    self.primaryFlow.intensity = self.source.intensity;
    self.primaryFlow.source = self.source;
    [self.primaryFlow generateSubflows];
    [self.primaryFlow flow];
}

@end
