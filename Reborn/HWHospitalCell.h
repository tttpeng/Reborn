//
//  HWHospitalCell.h
//  Reborn
//
//  Created by tpeng on 2016/11/23.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWTableViewCell.h"
#import "HWHospitalViewModel.h"

@interface HWHospitalCell : HWTableViewCell

@property (nonatomic, strong) UIImageView *pictureView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@end
