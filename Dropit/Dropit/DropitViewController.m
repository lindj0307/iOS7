//
//  DropitViewController.m
//  Dropit
//
//  Created by 林东杰 on 10/20/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "DropitViewController.h"
#import "DropitBehavior.h"
#import "BezierPathView.h"

@interface DropitViewController () <UIDynamicAnimatorDelegate>

@property (weak, nonatomic) IBOutlet BezierPathView *gameView;
/* 创建一个动画对象 */
@property (strong, nonatomic) UIDynamicAnimator *animator;
/* 创建动画行为对象 */
@property (strong, nonatomic) DropitBehavior *dropBehavior;
/* 创建吸附行为对象 */
@property (strong, nonatomic) UIAttachmentBehavior *attachment;
/* 正在落下的view */
@property (strong, nonatomic) UIView *droppingView;

@end

@implementation DropitViewController

#pragma mark - Variable
static const CGSize DROP_SIZE = { 41.5,41.5 };

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Event Response

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [self drop];
}


#pragma mark - TableView Delegate

#pragma mark - DynamicAnimator Delegate

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator *)animator {
    [self removeCompleteRows];
}

-(void)dynamicAnimatorWillResume:(UIDynamicAnimator *)animator {
    
}

#pragma mark - Private Methods

- (IBAction)panDrop:(UIPanGestureRecognizer *)sender {
    CGPoint gesturePoint = [sender locationInView:self.gameView];
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self attachDroppingViewToPoint:gesturePoint];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        self.attachment.anchorPoint =gesturePoint;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [self.animator removeBehavior:self.attachment];
        self.gameView.path = nil;
    }
}

- (void)attachDroppingViewToPoint:(CGPoint)anchorPoint {
    if (self.droppingView) {
        self.attachment = [[UIAttachmentBehavior alloc] initWithItem:self.droppingView attachedToAnchor:anchorPoint];
        UIView *droppingView = self.droppingView;
        /*? 疑问 */
        __weak DropitViewController *weakSelf = self;
        self.attachment.action = ^ {
            UIBezierPath *path = [[UIBezierPath alloc] init];
            [path moveToPoint:weakSelf.attachment.anchorPoint];
            [path addLineToPoint:droppingView.center];
            weakSelf.gameView.path = path;
        };
        self.droppingView = nil;
        [self.animator addBehavior:self.attachment];
    }
}

- (void)drop {
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size =DROP_SIZE;
    int x = (arc4random()%(int)self.gameView.bounds.size.width)/DROP_SIZE.width;
    frame.origin.x = x *DROP_SIZE.width;
    
    /* 添加view */
    UIView *dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [self randomColor];
    [self.gameView addSubview:dropView];
    
    self.droppingView = dropView;
    
    /* 添加动画效果 */
    [self.dropBehavior addItem:dropView];
}

- (UIColor *)randomColor {
    switch (arc4random()%5) {
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}

- (void)removeCompleteRows {
    NSMutableArray *dropToRemove = [[NSMutableArray alloc] init];
    for (CGFloat y = self.gameView.bounds.size.height - DROP_SIZE.height/2; y > 0; y -= DROP_SIZE.height) {
        BOOL rowsIsComplete = YES;
        NSMutableArray *dropsFound = [[NSMutableArray alloc] init];
        for (CGFloat x = DROP_SIZE.width/2; x <= self.gameView.bounds.size.width - DROP_SIZE.width/2; x+=DROP_SIZE.width) {
            UIView *hitView = [self.gameView hitTest:CGPointMake(x, y) withEvent:NULL];
            if ([hitView superview] == self.gameView) {
                [dropsFound addObject:hitView];
            } else {
                rowsIsComplete = NO;
                break;
            }
        }
        if (![dropsFound count]) break;
        if (rowsIsComplete) [dropToRemove addObjectsFromArray:dropsFound];
    }
    
    if ([dropToRemove count]) {
        for (UIView *drop in dropToRemove) {
            [self.dropBehavior removeItem:drop];
        }
        [self animateRemovingDrops:dropToRemove];
    }
}

- (void)animateRemovingDrops:(NSMutableArray *)dropToRemove {
    [UIView animateWithDuration:1.0 animations:^{
        for (UIView *drop in dropToRemove) {
            int x = (arc4random() %(int)(self.gameView.bounds.size.width*5)) - (int)self.gameView.bounds.size.width *2;
            int y = self.gameView.bounds.size.height;
            drop.center = CGPointMake(x, -y);
        }
    } completion:^(BOOL finished) {
        [dropToRemove makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }];
    
}

#pragma mark - Getters/Setters

/* 养成习惯 getter and setter 都要设置 */
@synthesize animator = _animator;

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
        _animator.delegate = self;
    }
    return _animator;
}

- (void)setAnimator:(UIDynamicAnimator *)animator {
    _animator = animator;
}

@synthesize dropBehavior = _dropBehavior;

- (DropitBehavior *)dropBehavior {
    if (!_dropBehavior) {
        _dropBehavior = [[DropitBehavior alloc] init];
        [self.animator addBehavior:_dropBehavior];
    }
    return _dropBehavior;
}

- (void)setDropBehavior:(DropitBehavior *)dropBehavior {
    _dropBehavior = dropBehavior;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
