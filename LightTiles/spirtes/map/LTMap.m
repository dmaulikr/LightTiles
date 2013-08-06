//
//  LTMap.m
//  LightTiles
//
//  Created by Kevin Jenkins on 7/29/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTMap.h"

@implementation LTMap

#pragma mark - Initialization
- (id)init {

    self = [super init];
    if (self) {
        self.size = CGSizeZero;
        self.tileMap = @{};
    }
    return self;
}

- (id)initWithSize:(CGSize)size {

    self = [super init];
    if (self) {
        self.size = size;
        self.tileMap = @{};
    }
    return self;
}

+ (id)map {

    return [[LTMap alloc] init];
}

+ (id)mapWithSize:(CGSize)size {

    return [[LTMap alloc] initWithSize:size];
}

#pragma mark - Layout
- (void)layout {

    CGFloat heightLeft = self.size.height;
    CGFloat widthLeft = self.size.width;

    int row = 0;
    int col = 0;

    while (heightLeft > 0.0) {

        widthLeft = self.size.width;
        col = 0;
        
        while (widthLeft > 0.0) {

            LTMapTileType tileType;
            if (arc4random_uniform(100) > 90) {
                tileType = shrubTile;
            } else {
                tileType = grassTile;
            }

            LTMapTile *tile = [LTMapTile mapTileWithType:tileType andMap:self];
            tile.position = CGPointMake((col+0.5)*[LTMapTile size].width, (row+0.5)*[LTMapTile size].height);
            tile.location = CGPointMake(col, row);
            [self setTile:tile forLocation:CGPointMake(col, row)];
            [self addChild:tile];

            widthLeft = widthLeft - [LTMapTile size].width;
            col = col + 1;
        }
        heightLeft = heightLeft - [LTMapTile size].height;
        row = row + 1;
    }
    self.tileMapSize = CGSizeMake(col, row);
}

#pragma mark - Tile Access
- (NSString *)keyForLocation:(CGPoint)location {

    return [NSString stringWithFormat:@"tile-%i:%i", (int)location.y, (int)location.x];
}

- (LTMapTile *)tileAtLocation:(CGPoint)location {

    return self.tileMap[[self keyForLocation:location]];
}
- (void)setTile:(LTMapTile *)tile forLocation:(CGPoint)location {

    NSMutableDictionary *tempMap = self.tileMap.mutableCopy;
    tempMap[[self keyForLocation:location]] = tile;
    self.tileMap = tempMap;
}

#pragma mark - LTFlowMap
- (CGFloat)reductionValueAtLocation:(CGPoint)point {
    return [[self tileAtLocation:point] lightAbsorption];
}
- (CGSize)flowMapSize {
    return self.tileMapSize;
}
- (void)updateLocation:(CGPoint)location withIntensity:(CGFloat)intensity {
    NSLog(@"Setting tile at location %@ to have intensity %2.2f", NSStringFromCGPoint(location), intensity);
    LTMapTile *tile = [self tileAtLocation:location];
    [tile addAmbientLight:intensity];
}

@end
