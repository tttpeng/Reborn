//
//  HWTableViewCell.m
//  Reborn
//
//  Created by tpeng on 2016/11/18.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWTableViewCell.h"
#import "UIView+AddLine.h"
#import "HWColorTheme.h"


@implementation HWTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    [self lifeCycle];
  }
  return self;
}

- (void)lifeCycle
{
  NSLog(@":->>>");
  [self setup];
  [self cellConstraints];
  [self updateCellConstraints];
}

- (void)setup
{
  self.bounds = [UIScreen mainScreen].bounds;
  self.contentView.bounds = [UIScreen mainScreen].bounds;
  self.selectionStyle = UITableViewCellSelectionStyleNone;
  self.accessoryType = UITableViewCellAccessoryNone;
  _bottomLine = [self.contentView addBottomLine];
  _bottomLine.backgroundColor = BACKGROUND_COLOR;
}


- (void)prepareForReuse
{
  [super prepareForReuse];
  
  //修复 cell 复用时，layout 的 subview 超出 contentView 时候的约束警告。
  self.contentView.bounds = [UIScreen mainScreen].bounds;
}


- (void)cellConstraints
{
  NSLog(@"--->");
  
}

- (void)updateCellConstraints
{
  
}




@end
