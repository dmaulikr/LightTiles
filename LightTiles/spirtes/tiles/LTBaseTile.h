//
//  LTBaseTile.h
//  LightTiles
//
//  Created by Kevin Jenkins on 7/29/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef enum {

    north,
    east,
    south,
    west

} LTBaseTileDirection;

@interface LTBaseTile : SKNode

@property (strong, nonatomic) NSArray *adjacentTiles;

- (id)init;
+ (id)tile;

- (void)setAdjacentTile:(LTBaseTile *)tile withDirection:(LTBaseTileDirection)direction;
- (LTBaseTile *)tileForDirection:(LTBaseTileDirection)direction;

@end
