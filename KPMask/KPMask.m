//
//  KPMaskBaseView.m
//  Drex
//
//  Created by kunpeng on 16/3/8.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import "KPMask.h"
#import "YXEasing.h"

#define WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface KPMask ()

@property (nonatomic,strong) UIView *maskView;
@property (nonatomic,strong) UIView *aboveView;
@property (nonatomic,strong) UIWindow *maskWindow;
@end

@implementation KPMask

+ (instancetype)shareMask {
    static KPMask *mask;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        mask = [[[self class] alloc] init];
    });
    return mask;
}

- (void)configMaskAboveView:(UIView *)view {
    
    _aboveView = view;
    [self configMaskView:_aboveView];
    [self showMaskView:_aboveView];
}

- (void)configMaskView:(UIView *)aboveView {

    _maskWindow = [[UIApplication sharedApplication].windows firstObject];
    _maskWindow.backgroundColor = [UIColor clearColor];
    _maskView = [[UIView alloc]initWithFrame:_maskWindow.bounds];
    _maskView.backgroundColor = [UIColor blackColor];
    _maskView.alpha = 0;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(gestureEvent)];
    [_maskView addGestureRecognizer:gesture];
    [self addToWindow:aboveView];
}

- (void)showMaskView:(UIView *)aboveView {
    
    [_maskWindow addSubview:_maskView];
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
        _maskView.alpha = 0.4;
    } completion:nil];
    [self addToWindow:aboveView];
    [self yxEasing:HEIGHT - aboveView.frame.size.height/2];
}

- (void)hiddenMaskView {
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
        _maskView.alpha = 0;
    } completion:^(BOOL finished) {
        
        [_maskView removeFromSuperview];
    }];
    
    [self yxEasing:HEIGHT + _aboveView.frame.size.height/2];
}

- (void)addToWindow:(UIView *)view {
    
    [_maskWindow insertSubview:view aboveSubview:_maskView];
}

#pragma mark - 缓动函数
- (void)yxEasing:(CGFloat)y {
    
    CAKeyframeAnimation *bounceKeyFrameAnimation = [CAKeyframeAnimation animation];
    bounceKeyFrameAnimation.keyPath = @"position";
    bounceKeyFrameAnimation.duration = 0.5;
    bounceKeyFrameAnimation.values = [YXEasing calculateFrameFromPoint:_aboveView.center
                                                               toPoint:CGPointMake(CGRectGetWidth(_aboveView.frame)/2,y)
                                                                  func:QuarticEaseOut //缓动类型
                                                            frameCount:0.5 * 30];
    _aboveView.center = CGPointMake(CGRectGetWidth(_aboveView.frame)/2,y);
    [_aboveView.layer addAnimation:bounceKeyFrameAnimation forKey:nil];
}

- (void)gestureEvent {
    
    [self hiddenMaskView];
}

@end
