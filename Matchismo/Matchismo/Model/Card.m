//
//  Card.m
//  Matchismo
//
//  Created by 林东杰 on 10/7/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end

