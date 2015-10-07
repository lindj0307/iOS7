//
//  Card.h
//  Matchismo
//
//  Created by 林东杰 on 10/7/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString *contents;
@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;
@end
