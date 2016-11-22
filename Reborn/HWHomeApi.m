//
//  HWHomeApi.m
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeApi.h"

@implementation HWHomeApi


- (NSString *)baseUrl
{
  return @"http://123.56.182.156:8080/zhongmeban/api";
}

- (NSString *)requestUrl
{
  return @"hospital/getHospitalPage";
}

- (HWRequestMethod)requestMethod
{
  return HWRequestMethodGET;
}

- (id)requestArgument
{
  return @{@"pageIndex":@1};
}

@end
