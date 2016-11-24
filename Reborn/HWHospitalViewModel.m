//
//  HWHospitalViewModel.m
//  Reborn
//
//  Created by tpeng on 2016/11/23.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHospitalViewModel.h"

@implementation HWHospitalViewModel



+ (instancetype)viewModelWith:(HWHospital *)hospital
{
  HWHospitalViewModel *viewModel = [[HWHospitalViewModel alloc] init];
  viewModel.pictureURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://zhongmeban-picture-bucket.oss-cn-beijing.aliyuncs.com%@",hospital.picture]];
  viewModel.hospitalName = hospital.hospitalName;
  viewModel.addressName = hospital.address;
  return viewModel;
}


@end
