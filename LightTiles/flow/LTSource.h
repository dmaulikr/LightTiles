//
//  LTSource.h
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTFlowMap.h"
#import "LTSpout.h"

@interface LTSource : NSObject

@property (strong, nonatomic) __block id<LTFlowMap> flowMap;
@property (assign, nonatomic) CGFloat intensity;
@property (strong, nonatomic) NSSet *spouts;
@property (assign, nonatomic) CGPoint locaiton;
@property (copy, nonatomic) CGFloat (^reductionMap)(CGPoint);

+ (id)source;
- (void)flow;
- (void)addSpout:(LTSpout *)spout;

@end
