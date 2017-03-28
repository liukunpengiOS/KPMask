//
//  ViewController.m
//  Demo
//
//  Created by kunpeng on 2017/3/27.
//  Copyright © 2017年 liukunpeng. All rights reserved.
//

#import "ViewController.h"
#import "KPMask.h"

@implementation ViewController

- (IBAction)showMask:(UIButton *)sender {
    
    UIView *demo = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 100)];
    demo.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureEvent:)];
    [demo addGestureRecognizer:tapGesture];
    
    [[KPMask shareMask] configMaskAboveView:demo];
}

- (void)tapGestureEvent:(UITapGestureRecognizer *)tagGesture {
    
    [[KPMask shareMask] hidden];
}

@end
