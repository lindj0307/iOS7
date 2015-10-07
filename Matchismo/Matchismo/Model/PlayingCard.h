//
//  PlayingCard.h
//  Matchismo
//
//  Created by 林东杰 on 10/7/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
