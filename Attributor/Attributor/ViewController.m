//
//  ViewController.m
//  Attributor
//
//  Created by 林东杰 on 10/14/15.
//  Copyright © 2015 Anta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *header;
@property (weak, nonatomic) IBOutlet UITextView *body;

@end

@implementation ViewController

- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)outLineBodySelection {
    [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName:@-3 ,
                                            NSStrokeColorAttributeName:[UIColor blackColor]} range:self.body.selectedRange];
}

- (IBAction)unoutLineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
