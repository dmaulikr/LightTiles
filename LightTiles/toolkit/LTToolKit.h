//
//  LTToolKit.h
//  LightTiles
//
//  Created by Kevin Jenkins on 8/5/13.
//  Copyright (c) 2013 somethingpointless. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LTToolKit : SKNode

@property (assign, nonatomic) CGSize size;
@property (strong, nonatomic) NSDictionary *tools;

+ (id)toolkit;
+ (id)toolkitWithSize:(CGSize)size;
- (id)initWithSize:(CGSize)size;

- (void)addTool:(LTTool *)tool;

@end
