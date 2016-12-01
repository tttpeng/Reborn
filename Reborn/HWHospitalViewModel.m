//
//  HWHospitalViewModel.m
//  Reborn
//
//  Created by tpeng on 2016/12/1.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHospitalViewModel.h"

@implementation HWHospitalViewModel
@synthesize store;

- (HWHospital *)hospitalAtIndex:(NSInteger)index
{
  return self.store.hospitals[index];
}

- (NSURL *)hospitalPictureURLAtIndex:(NSInteger)index
{
  HWHospital *hospital = [self hospitalAtIndex:index];
  return  [[NSURL alloc] initWithString:[NSString stringWithFormat:@"http://zmb-bucket.oss-cn-beijing.aliyuncs.com/%@",hospital.picture]];

}

- (NSString *)hospitalNameAtIndex:(NSInteger)index
{
  HWHospital *hospital = [self hospitalAtIndex:index];
  return hospital.hospitalName;
}

- (NSString *)hospitalAddressAtIndex:(NSInteger)index
{
  HWHospital *hospital = [self hospitalAtIndex:index];
  return hospital.address;
}



@end
