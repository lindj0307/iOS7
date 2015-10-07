//
//  Deck.h
//  Matchismo
//
//  Created by 林东杰 on 10/7/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
