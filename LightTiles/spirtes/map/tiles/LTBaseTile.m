//
//  LTBaseTile.m
//  LightTiles
//
//  Created by Kevin Jenkins on 7/29/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTBaseTile.h"

@implementation LTBaseTile

#pragma mark - Initialization
- (id)initWithMap:(LTMap *)map {

    self = [super init];
    if (self) {
        self.map = map;
        self.location = CGPointZero;
        self.adjacentTiles = @[[NSNull null], [NSNull null], [NSNull null], [NSNull null]];
    }
    return self;
}
+ (id)tileWithMap:(LTMap *)map {

    return [[LTBaseTile alloc] initWithMap:map];
}

#pragma mark - Adjacency
- (void)setAdjacentTile:(LTBaseTile *)tile withDirection:(LTBaseTileDirection)direction {

    NSMutableArray *temp = self.adjacentTiles.mutableCopy;
    temp[direction] = tile;
    self.adjacentTiles = temp;
}

- (LTBaseTile *)tileForDirection:(LTBaseTileDirection)direction {
    if (self.adjacentTiles[direction] == [NSNull null]) { return nil; }
    return self.adjacentTiles[direction];
}

@end
