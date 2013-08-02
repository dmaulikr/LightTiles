//
//  LTSpout.h
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTFlow.h"

@class LTSource;

@interface LTSpout : NSObject

@property (assign, nonatomic) LTFlowDirection direction;
@property (strong, nonatomic) LTSource *source;
@property (strong, nonatomic) LTFlow *primaryFlow;

- (id)initWithSource:(LTSource *)source andDirection:(LTFlowDirection)direction;
+ (id)spoutWithSource:(LTSource *)source andDirection:(LTFlowDirection)direction;
- (void)flow;

@end
