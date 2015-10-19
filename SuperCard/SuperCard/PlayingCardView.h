//
//  PlayingCardView.h
//  SuperCard
//
//  Created by 林东杰 on 10/18/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
@property (nonatomic) NSInteger rank;
@property (strong,nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;
@end
