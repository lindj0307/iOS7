//
//  DropitBehavior.h
//  Dropit
//
//  Created by 林东杰 on 10/21/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
