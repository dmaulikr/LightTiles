//
//  LTBaseTile.h
//  LightTiles
//
//  Created by Kevin Jenkins on 7/29/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class LTMap;

typedef enum {

    LTBaseTileDirectionNorth, LTBaseTileDirectionEast, LTBaseTileDirectionSouth, LTBaseTileDirectionWest

} LTBaseTileDirection;

@interface LTBaseTile : SKNode

@property (weak, nonatomic) LTMap *map;
@property (strong, nonatomic) NSArray *adjacentTiles;
@property (assign, nonatomic) CGPoint location;

- (id)initWithMap:(LTMap *)map;
+ (id)tileWithMap:(LTMap *)map;

- (void)setAdjacentTile:(LTBaseTile *)tile withDirection:(LTBaseTileDirection)direction;
- (LTBaseTile *)tileForDirection:(LTBaseTileDirection)direction;

@end
