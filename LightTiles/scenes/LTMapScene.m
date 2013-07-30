//
//  LTMapScene.m
//  LightTiles
//
//  Created by Kevin Jenkins on 7/26/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTMapScene.h"
#import "LTMapTile.h"

@implementation LTMapScene

#pragma mark - Initialization
- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */

        self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        self.tileMap = @{};
        [self layoutMap];
    }
    return self;
}

#pragma mark - Map Setup
- (void)layoutMap {

    NSMutableDictionary *tempMap = @{}.mutableCopy;

    CGFloat heightLeft = self.size.height;
    int row = 0;
    while (heightLeft > 0.0) {
        CGFloat widthLeft = self.size.width;
        int col = 0;
        while (widthLeft > 0.0) {
            LTMapTile *tile = [LTMapTile mapTileWithType:grassTile];
            tempMap[[NSString stringWithFormat:@"tile-%i:%i", row, col]] = tile;
            tile.position = CGPointMake((col+0.5)*[LTMapTile size].width, (row+0.5)*[LTMapTile size].height);
            widthLeft = widthLeft - [LTMapTile size].width;
            col = col + 1;
            [self addChild:tile];
        }
        heightLeft = heightLeft - [LTMapTile size].height;
        row = row + 1;
    }
}

#pragma mark - Touch Interactions
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}

#pragma mark - Game loop
- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


@end
