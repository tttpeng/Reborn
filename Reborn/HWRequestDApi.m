//
//  HWRequestDApi.m
//  Reborn
//
//  Created by tpeng on 2016/11/11.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWRequestDApi.h"

@implementation HWRequestDApi

- (NSString *)baseUrl
{
  return @"http://10.90.0.44:8080/zhongmeban/api";
}

- (NSString *)requestUrl
{
  return @"doctor/getDoctorPage";
}

- (id)requestArgument
{
  return @{
           @"pageIndex":@"1",
           @"pageSize": @"5"
           };
}

@end
