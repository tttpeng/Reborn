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

- (void)bindDataWith:(HWHospitalViewModel *)viewModel;

@end
