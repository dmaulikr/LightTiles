//
//  LTFlowMap.h
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LTFlowMap <NSObject>

- (CGSize)flowMapSize;
- (CGFloat)reductionValueAtLocation:(CGPoint)point;
- (void)updateLocation:(CGPoint)location withIntensity:(CGFloat)intensity;

@end
