//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by 林东杰 on 10/12/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger) index;
- (Card *)cardAtIndex:(NSInteger) index;

@property (nonatomic,readonly) NSInteger score;

@end
