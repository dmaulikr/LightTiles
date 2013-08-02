//
//  LTFlow.h
//  LightTiles
//
//  Created by Kevin Jenkins on 8/1/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { LTFlowDirectionNorth, LTFlowDirectionEast, LTFlowDirectionSouth, LTFlowDirectionWest } LTFlowDirection;

@class LTSource;

@interface LTFlow : NSObject

@property (strong, nonatomic) LTSource *source;
@property (strong, nonatomic) LTFlow *parent;
@property (strong, nonatomic) NSSet *subflows;
@property (assign, nonatomic) LTFlowDirection direction;
@property (assign, nonatomic) CGPoint location;
@property (assign, nonatomic) CGFloat intensity;

- (id)initWithParent:(LTFlow *)parentFlow andDirection:(LTFlowDirection)direction;
+ (id)flowWithParent:(LTFlow *)parentFlow andDirection:(LTFlowDirection)direction;

- (void)generateSubflows;
- (BOOL)shouldFlowAtLocation:(CGPoint)location;
- (void)flow;
+ (CGPoint)locationFromLocation:(CGPoint)location andDirection:(LTFlowDirection)direction;
+ (LTFlowDirection)directionRightOrthogonal:(LTFlowDirection)direction;
+ (LTFlowDirection)directionLeftOrthogonal:(LTFlowDirection)direction;


@end
