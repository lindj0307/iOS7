//
//  ViewController.m
//  Imaginarium
//
//  Created by 林东杰 on 10/25/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        ImageViewController *ivc = (ImageViewController *)segue.destinationViewController;
        UIButton *btn =  (UIButton *)sender;
        ivc.title = [btn currentTitle];
        if ([segue.identifier isEqualToString: @"picture1"]) {
            ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.netbian.com/file/2015/1019/5e7289765297390113d104161428a341.jpg"]];
        }
        if ([segue.identifier isEqualToString: @"picture2"]) {
            ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.netbian.com/file/2015/1024/99e8599090749003137ea46bf1e7b58f.jpg"]];
        }
        if ([segue.identifier isEqualToString: @"picture3"]) {
            ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.netbian.com/file/2015/1026/206cb7d2816c2775c38ac83a21b50268.jpg"]];
        }
    }
}

@end
