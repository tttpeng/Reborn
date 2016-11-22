//
//  HWTableViewCell.h
//  Reborn
//
//  Created by tpeng on 2016/11/18.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HWTableViewCell : UITableViewCell

/** Cell统一下边框。不需要时需要隐藏 */
@property (nonatomic , strong) UIView *bottomLine;


/** cell 的初始配置方法 需要实现 suepr */
- (void)setup __attribute__((objc_requires_super));





/** 在 lifeCycle 里调用。里面为固定不变的约束 */
- (void)cellConstraints;

/** @brief  在 lifeCycle 里调用。需要变化的约束写在这里 */
- (void)updateCellConstraints;


@end
