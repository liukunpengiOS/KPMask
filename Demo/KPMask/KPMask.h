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
 *  Mask单例
 *
 *  @return 返回遮罩视图实例
 */
+ (instancetype)shareMask;

/**
 *  呈现Mask
 *
 *  @param view 显示在Mask之上的视图
 */
- (void)configMaskAboveView:(UIView *)view;

/**
 *  隐藏Mask
 */
- (void)hidden;

@end
