//
//  HWRequestCApi.m
//  Reborn
//
//  Created by tpeng on 2016/11/11.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWRequestCApi.h"

@implementation HWRequestCApi

- (NSString *)baseUrl
{
  return @"http://123.56.182.156:8080/zhongmeban/api";
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
