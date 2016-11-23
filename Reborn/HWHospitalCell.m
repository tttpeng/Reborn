//
//  HWHospitalCell.m
//  Reborn
//
//  Created by tpeng on 2016/11/23.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHospitalCell.h"
#import <Masonry/Masonry.h>
#import <UIImageView+WebCache.h>

@interface HWHospitalCell ()

@property (nonatomic, strong) UIImageView *pictureView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@end

@implementation HWHospitalCell



- (void)setup
{
  [super setup];
  
  [self.contentView addSubview:self.pictureView];
  [self.contentView addSubview:self.nameLabel];
  [self.contentView addSubview:self.addressLabel];
  
}

- (void)bindDataWith:(HWHospitalViewModel *)viewModel
{
  [_pictureView sd_setImageWithURL:viewModel.pictureURL placeholderImage:nil];
  _nameLabel.text = viewModel.hospitalName;
  _addressLabel.text = viewModel.addressName;
}

- (void)cellConstraints
{
  [self.pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.left.equalTo(self.contentView).offset(15);
    make.bottom.equalTo(self.contentView).offset(-15);
    make.height.width.mas_equalTo(100);
  }];
  
  [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.pictureView.mas_right).offset(15);
    make.right.equalTo(self.contentView).offset(-15);
    make.top.equalTo(self.contentView).offset(15);
    make.height.mas_equalTo(30);
  }];
  
  [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.nameLabel).offset(10);
    make.left.right.equalTo(self.nameLabel);
    make.bottom.equalTo(self.contentView).offset(-15);
  }];
}


- (UILabel *)addressLabel
{
  if (_addressLabel == nil) {
    _addressLabel = [[UILabel alloc] init];
  }
  return _addressLabel;
}

- (UILabel *)nameLabel
{
  if (_nameLabel == nil) {
    _nameLabel = [[UILabel alloc] init];
  }
  return _nameLabel;
}

- (UIImageView *)pictureView
{
  if (_pictureView == nil) {
    _pictureView = [[UIImageView alloc] init];
    _pictureView.backgroundColor = [UIColor redColor];
  }
  return _pictureView;
}

@end
