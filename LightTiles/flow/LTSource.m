//
//  LTSource.m
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTSource.h"
#import "LTSpout.h"

@implementation LTSource

#pragma mark - Initialization
- (id)init {

    self = [super init];
    if (self) {
        self.intensity = 0;
        self.spouts = [NSSet set];
        self.flowMap = nil;

        __unsafe_unretained typeof(self) weakSelf = self;
        self.reductionMap = ^(CGPoint point){
            if (!weakSelf.flowMap) return 1.0f;
            else return [weakSelf.flowMap reductionValueAtLocation:point];
        };
    }

    return self;
}

+ (id)source {
    return [[LTSource alloc] init];
}

#pragma mark - Setters
- (void)setFlowMap:(id<LTFlowMap>)flowMap {
    _flowMap = flowMap;
}

#pragma mark - Flow
- (void)flow {
    [self.flowMap updateLocation:self.locaiton withIntensity:self.intensity];
    for (LTSpout *spout in self.spouts) {
        [spout flow];
    }
}

#pragma mark - Spout Hooks
- (void)addSpout:(LTSpout *)spout {

    NSMutableSet *newSpouts = self.spouts.mutableCopy;
    [newSpouts addObject:spout];
    self.spouts = newSpouts;
}

@end
