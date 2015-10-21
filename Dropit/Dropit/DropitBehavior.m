//
//  DropitBehavior.m
//  Dropit
//
//  Created by 林东杰 on 10/21/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "DropitBehavior.h"

@interface DropitBehavior()
/* 创建一个重力动画行为 */
@property (strong, nonatomic) UIGravityBehavior *gravity;
/* 创建碰撞动画行为 */
@property (strong, nonatomic) UICollisionBehavior *collider;

@property (strong, nonatomic) UIDynamicItemBehavior *animationOptions;

@end

@implementation DropitBehavior


@synthesize gravity = _gravity;

- (UIGravityBehavior *)gravity {
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 1;
    }
    return _gravity;
}

- (void)setGravity:(UIGravityBehavior *)gravity {
    _gravity = gravity;
}

@synthesize collider = _collider;

- (UICollisionBehavior *)collider {
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        /*? 疑问 */
        _collider.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collider;
}

- (void)setCollider:(UICollisionBehavior *)collider {
    _collider = collider;
}

@synthesize animationOptions = _animationOptions;

- (UIDynamicItemBehavior *)animationOptions {
    if (!_animationOptions) {
        _animationOptions = [[UIDynamicItemBehavior alloc] init];
        _animationOptions.allowsRotation = NO;
    }
    return _animationOptions;
}

- (void)setAnimationOptions:(UIDynamicItemBehavior *)animationOptions {
    _animationOptions = animationOptions;
}

- (void)addItem:(id <UIDynamicItem>)item {
    [self.gravity addItem:item];
    [self.collider addItem:item];
    [self.animationOptions addItem:item];
}

- (void)removeItem:(id <UIDynamicItem>)item {
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.animationOptions removeItem:item];
}

- (instancetype)init {
    self = [super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    [self addChildBehavior:self.animationOptions];
    return self;
}

@end
