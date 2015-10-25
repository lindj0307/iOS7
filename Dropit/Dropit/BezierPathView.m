//
//  BezierPathView.m
//  Dropit
//
//  Created by 林东杰 on 10/21/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView


- (void)setPath:(UIBezierPath *)path {
    _path = path;
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}



@end
