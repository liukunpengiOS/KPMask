//
//  KPMaskBaseView.h
//  Drex
//
//  Created by kunpeng on 16/3/8.
//  Copyright © 2016年 liukunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPMask : UIView

/**
 *  遮罩单例
 *
 *  @return 返回遮罩视图实例
 */
+ (instancetype)shareMask;

/**
 *  配置遮罩视图
 *
 *  @param view 显示在遮罩之上的视图
 */
- (void)configMaskAboveView:(UIView *)view;

@end
