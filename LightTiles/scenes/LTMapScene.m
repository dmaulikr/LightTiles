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
        self.map = [LTMap mapWithSize:self.size];
        [self.map layout];
        [self addChild:self.map];
    }
    return self;
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
