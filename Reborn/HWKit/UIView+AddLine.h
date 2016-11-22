//
//  UIView+AddLine.h
//  ZhongMeBan
//
//  Created by tpeng on 2016/11/4.
//  Copyright © 2016年 ideabinder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AddLine)
/**
 *
 *  生成一个可以自定义 frame 的分割线
 *
 *  @return 返回一个view
 *
 */
- (UIView *)addLineWithoutFrame;

/**
 *
 *  在view最上方，加一根与指定view宽度相等的头部边缘线
 *
 *  @return 返回alloc的分割线
 *
 */
- (UIView *)addTopLine;

/**
 *
 *  在view最下方，加一根与指定view宽度相等的底部边缘线
 *
 *  @return 返回alloc的分割线
 *
 */
- (UIView *)addBottomLine;


/**
 *
 *  给指定的view，加一跟中心水平线
 *
 *  @param left    竖直线距离设定的view左边的距离
 *  @param right   竖直线距离设定的view右边的距离
 *
 *  @return 返回alloc的中心竖直线
 *
 */
- (UIView *)addCenterHorizontalLineWithLeft:(CGFloat)left right:(CGFloat)right;


/**
 *
 *  给指定的view，加一跟中心竖直线
 *
 *  @param top    竖直线距离设定的view上边的距离
 *  @param bottom 竖直线距离设定的view下边的距离
 *
 *  @return 返回alloc的中心竖直线
 *
 */
- (UIView *)addCenterVerticalLineWithTop:(CGFloat)top bottom:(CGFloat)bottom;


/**
 *
 *  给指定的view的最下边缘，加一根长度可设置的头部边缘线（最长不超过该view的宽度）
 *
 *  @param left  头部边缘线距离设定view左边的距离
 *  @param right 头部边缘线距离设定view左边的距离
 *
 *  @return 返回长度可设置的头部边缘线
 *
 */
- (UIView *)addTopLineWithLeft:(CGFloat)left right:(CGFloat)right;


/**
 *
 *  给指定的view的最下边缘，加一根长度可设置的底部边缘线（最长不超过该view的宽度）
 *
 *  @param left  底部边缘线距离设定view左边缘的距离
 *  @param right 底部边缘线距离设定view右边缘的距离
 *
 *  @return 返回长度可设置的底部边缘线
 *
 */
- (UIView *)addBottomLineWithLeft:(CGFloat)left right:(CGFloat)right;



/**
 *
 *  给指定的view，加一根长度可设置的水平线，以Top为Y方向的基准点
 *
 *  @param top   水平线距离设定view上边缘的距离
 *  @param left  水平线距离设定view左边缘的距离
 *  @param right 水平线距离设定view右边缘的距离
 *
 *  @return 返回水平线
 *
 */
- (UIView *)addHorizontalLineWithTop:(CGFloat)top left:(CGFloat)left right:(CGFloat)right;
/**
 *
 *  给指定的view，加一根长度可设置的水平线，以Bottom为Y方向的基准点
 *
 *  @param bottom 水平线距离设定view下边缘的距离
 *  @param left   水平线距离设定view左边缘的距离
 *  @param right  水平线距离设定view右边缘的距离
 *
 *  @return 返回水平线
 *
 */
- (UIView *)addHorizontalLineWithBottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right;


/**
 *
 *  给指定的view，加一根长度可设置的竖直线，以Left为X方向的基准点
 *
 *  @param left   竖直线距离设定view左边缘的距离
 *  @param top    竖直线距离设定view上边缘的距离
 *  @param bottom 竖直线距离设定view下边缘的距离
 *
 *  @return 返回竖直线
 *
 */
- (UIView *)addVerticalLineWithLeft:(CGFloat)left top:(CGFloat)top bottom:(CGFloat)bottom;

/**
 *
 *  给指定的view，加一根长度可设置的竖直线，以Right为X方向的基准点
 *
 *  @param right  竖直线距离设定view右边缘的距离
 *  @param top    竖直线距离设定view上边缘的距离
 *  @param bottom 竖直线距离设定view下边缘的距离
 *
 *  @return 返回竖直线
 *
 */
- (UIView *)addVerticalLineWithRight:(CGFloat)right top:(CGFloat)top bottom:(CGFloat)bottom;

@end
