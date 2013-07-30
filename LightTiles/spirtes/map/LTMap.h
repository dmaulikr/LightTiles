//
//  LTMap.h
//  LightTiles
//
//  Created by Kevin Jenkins on 7/29/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import "LTMapTile.h"

@interface LTMap : SKNode

@property (strong, nonatomic) NSDictionary *tileMap;
@property (assign, nonatomic) CGSize size;

- (id)init;
- (id)initWithSize:(CGSize)size;
+ (id)map;
+ (id)mapWithSize:(CGSize)size;

- (void)layout;

@end
