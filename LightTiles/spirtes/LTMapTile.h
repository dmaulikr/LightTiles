//
//  LTMapTile.h
//  LightTiles
//
//  Created by Kevin Jenkins on 7/26/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef enum {

    noTile,
    grassTile

} LTMapTileType;

@interface LTMapTile : SKNode

@property (strong, nonatomic) SKSpriteNode *background;
@property (strong, nonatomic) SKSpriteNode *shade;

@property (assign, nonatomic) CGFloat ambientLight;
@property (assign, nonatomic) CGFloat lightAbsorption;

@property (assign, nonatomic) LTMapTileType tileType;

@end
