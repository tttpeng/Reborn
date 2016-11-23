//
//  HWHospitalViewModel.m
//  Reborn
//
//  Created by tpeng on 2016/11/23.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHospitalViewModel.h"

@implementation HWHospitalViewModel

- (instancetype)initWithHospital:(HWHospital *)hospital
{
  self = [super init];
  if (self) {
    self.pictureURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://zhongmeban-picture-bucket.oss-cn-beijing.aliyuncs.com%@",hospital.picture]];
    self.hospitalName = hospital.hospitalName;
    self.addressName = hospital.address;
  }
  return self;
}



+ (instancetype)viewModelWith:(HWHospital *)hospital
{
  
}


@end
