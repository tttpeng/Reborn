//
//  UIView+AddLine.m
//  ZhongMeBan
//
//  Created by tpeng on 2016/11/4.
//  Copyright © 2016年 ideabinder. All rights reserved.
//

#import "UIView+AddLine.h"
#import <Masonry/Masonry.h>
#import "HWConstant.h"
#import "HWColorTheme.h"

@implementation UIView (AddLine)


- (UIView *)addLineWithoutFrame{
  
  UIView *line = [UIView new];
  line.backgroundColor = SEPARATOR_LINE_COLOR;
  [self addSubview:line];
  return line;
}

- (UIView *)addTopLine
{
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(0);
    make.left.mas_equalTo(0);
    make.right.mas_equalTo(0);
    make.height.offset(LINE_HEIGHT);
  }];
  return line;
}

- (UIView *)addBottomLine
{
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.mas_equalTo(0);
    make.left.mas_equalTo(0);
    make.right.mas_equalTo(0);
    make.height.offset(LINE_HEIGHT);
  }];
  
  return line;
}

- (UIView *)addCenterHorizontalLineWithLeft:(CGFloat)left right:(CGFloat)right{
  
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerY.mas_equalTo(0);
    make.left.mas_equalTo(left);
    make.right.mas_equalTo(right);
    make.height.offset(LINE_HEIGHT);
  }];
  
  return line;
}

- (UIView *)addCenterVerticalLineWithTop:(CGFloat)top bottom:(CGFloat)bottom{
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(top);
    make.centerX.mas_equalTo(0);
    make.bottom.mas_equalTo(bottom);
    make.width.offset(LINE_HEIGHT);
  }];
  return line;
}

- (UIView *)addTopLineWithLeft:(CGFloat)left right:(CGFloat)right{
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(0);
    make.left.mas_equalTo(left);
    make.right.mas_equalTo(right);
    make.height.offset(LINE_HEIGHT);
  }];
  
  return line;
}

- (UIView *)addBottomLineWithLeft:(CGFloat)left right:(CGFloat)right{
  
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.mas_equalTo(0);
    make.left.mas_equalTo(left);
    make.right.mas_equalTo(right);
    make.height.offset(LINE_HEIGHT);
  }];
  
  return line;
}

- (UIView *)addHorizontalLineWithTop:(CGFloat)top left:(CGFloat)left right:(CGFloat)right{
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(top);
    make.left.mas_equalTo(left);
    make.right.mas_equalTo(right);
    make.height.offset(LINE_HEIGHT);
  }];
  return line;
}

- (UIView *)addHorizontalLineWithBottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right{
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.bottom.mas_equalTo(bottom);
    make.left.mas_equalTo(left);
    make.right.mas_equalTo(right);
    make.height.offset(LINE_HEIGHT);
  }];
  return line;
}

- (UIView *)addVerticalLineWithLeft:(CGFloat)left top:(CGFloat)top bottom:(CGFloat)bottom{
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(top);
    make.left.mas_equalTo(left);
    make.bottom.mas_equalTo(bottom);
    make.width.offset(LINE_HEIGHT);
  }];
  return line;
}

- (UIView *)addVerticalLineWithRight:(CGFloat)right top:(CGFloat)top bottom:(CGFloat)bottom{
  UIView *line = [self addLineWithoutFrame];
  [line mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(top);
    make.right.mas_equalTo(right);
    make.bottom.mas_equalTo(bottom);
    make.width.offset(LINE_HEIGHT);
  }];
  return line;
}


@end
