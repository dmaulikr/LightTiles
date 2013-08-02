//
//  LTMapTile.m
//  LightTiles
//
//  Created by Kevin Jenkins on 7/26/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTMapTile.h"
#import "LTSource.h"
#import "LTMap.h"

static CGSize LTMapTileSize;

@implementation LTMapTile

#pragma mark - Initialization
+ (void)initialize {
    LTMapTileSize = CGSizeMake(32, 32);
}
- (id)initWithType:(LTMapTileType)type andMap:(LTMap *)map{

    self = [super initWithMap:map];
    if (self) {
        [self setupWithType:type];
    }
    return self;
}

+ (id)mapTileWithType:(LTMapTileType)type andMap:(LTMap *)map {
    return [[LTMapTile alloc] initWithType:type andMap:map];
}

- (void)setupWithType:(LTMapTileType)type {

    self.shade = [SKSpriteNode spriteNodeWithColor:[SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0] size:LTMapTileSize];

    self.tileType = type;
    self.ambientLight = 0.0;

    switch (self.tileType) {
        case noTile:
            self.lightAbsorption = 1.0;
            self.background = [SKSpriteNode spriteNodeWithColor:[SKColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0] size:LTMapTileSize];
            break;
        case grassTile:
            self.lightAbsorption = 0.9;
            self.background = [SKSpriteNode spriteNodeWithImageNamed:@"grass00.png"];
            break;

    }

    [self addChild:self.background];
    [self addChild:self.shade];
    self.userInteractionEnabled = YES;
}

#pragma mark - Setters/Getters
+ (CGSize)size {
    return LTMapTileSize;
}
- (void)setAmbientLight:(CGFloat)ambientLight {
    _ambientLight = ambientLight;
    self.shade.alpha = fmaxf(1.0 - ambientLight, 0.0);
}

#pragma mark - Touch Interactions
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    LTSource *lightSource = [LTSource source];
    lightSource.locaiton = self.location;
    lightSource.flowMap = self.map;
    lightSource.intensity = 1.0;
    LTSpout *spout = [LTSpout spoutWithSource:lightSource andDirection:LTFlowDirectionNorth];
    [lightSource addSpout:spout];
    [lightSource flow];
}

@end
