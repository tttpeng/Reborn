//
//  HWBaseViewController.h
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWBaseViewController : UIViewController


- (void)initController __attribute__((objc_requires_super));

/**
 *  @brief  设置导航栏 左边默认是返回按钮
 *
 *  @param title      导航tilte
 *  @param rightButtonTitle 右边文字型的按钮
 */
- (void)setNavigateTitle:(NSString *)title rightButtonTitle:(NSString *)rightButtonTitle;

- (void)rightButtonClicked:(UIButton *)button;

- (void)backAction:(UIButton *)button;

- (void)pushViewController:(UIViewController *)controller;

@end
