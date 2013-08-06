//
//  LTMapTile.h
//  LightTiles
//
//  Created by Kevin Jenkins on 7/26/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTBaseTile.h"

typedef enum {

    noTile,
    grassTile,
    shrubTile

} LTMapTileType;

@interface LTMapTile : LTBaseTile

@property (strong, nonatomic) SKSpriteNode *background;
@property (strong, nonatomic) SKSpriteNode *shade;
@property (assign, nonatomic) CGFloat ambientLight;
@property (assign, nonatomic) CGFloat lightAbsorption;
@property (assign, nonatomic) LTMapTileType tileType;
@property (strong, nonatomic) NSSet *components;

- (id)initWithType:(LTMapTileType)type andMap:(LTMap *)map;
+ (id)mapTileWithType:(LTMapTileType)type andMap:(LTMap *)map;

+ (CGSize)size;
- (void)addAmbientLight:(CGFloat)lightAmount;

@end
