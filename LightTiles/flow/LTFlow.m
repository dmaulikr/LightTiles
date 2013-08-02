//
//  LTFlow.m
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTFlow.h"
#import "LTSource.h"

@implementation LTFlow

#pragma mark - Initialization
- (id)initWithParent:(LTFlow *)parentFlow andDirection:(LTFlowDirection)direction{

    self = [super init];
    if (self) {
        self.parent = parentFlow;
        self.direction = direction;
        self.subflows = [NSSet set];
        self.intensity = 0;

        if (self.parent) {
            self.source = self.parent.source;
            self.location = [LTFlow locationFromLocation:self.parent.location andDirection:self.direction];
            self.intensity = self.parent.intensity * [self.source.flowMap reductionValueAtLocation:self.location];
        }
    }
    return self;
}
+ (id)flowWithParent:(LTFlow *)parentFlow andDirection:(LTFlowDirection)direction{
    return [[LTFlow alloc] initWithParent:parentFlow andDirection:direction];
}

#pragma mark - Flow
- (BOOL)shouldFlowAtLocation:(CGPoint)location {
    if (self.intensity <= 0) return NO;
    return [self.source.flowMap flowMapSize].width > location.x && [self.source.flowMap flowMapSize].height > location.y && location.x >= 0 && location.y >= 0;
}
- (void)generateSubflows {
    // override this in subclasses!
}
- (void)flow {

    [self.source.flowMap updateLocation:self.location withIntensity:self.intensity];

    for (LTFlow *subflow in self.subflows) {
        [subflow generateSubflows];
        [subflow flow];
    }
}

#pragma mark - Location Calculation
+ (CGPoint)locationFromLocation:(CGPoint)location andDirection:(LTFlowDirection)direction {
    switch (direction) {
        case LTFlowDirectionNorth: return CGPointMake(location.x, location.y+1);
        case LTFlowDirectionEast: return CGPointMake(location.x+1, location.y);
        case LTFlowDirectionSouth: return CGPointMake(location.x, location.y-1);
        case LTFlowDirectionWest: return CGPointMake(location.x-1, location.y);
    }
}
+ (LTFlowDirection)directionRightOrthogonal:(LTFlowDirection)direction {
    switch (direction) {
        case LTFlowDirectionNorth: return LTFlowDirectionEast;
        case LTFlowDirectionEast: return LTFlowDirectionSouth;
        case LTFlowDirectionSouth: return LTFlowDirectionWest;
        case LTFlowDirectionWest: return LTFlowDirectionNorth;
    }
}
+ (LTFlowDirection)directionLeftOrthogonal:(LTFlowDirection)direction {
    switch (direction) {
        case LTFlowDirectionNorth: return LTFlowDirectionWest;
        case LTFlowDirectionEast: return LTFlowDirectionNorth;
        case LTFlowDirectionSouth: return LTFlowDirectionEast;
        case LTFlowDirectionWest: return LTFlowDirectionSouth;
    }
}

@end
