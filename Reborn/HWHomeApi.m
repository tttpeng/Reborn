//
//  HWHomeApi.m
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeApi.h"

@interface HWHomeApi ()

@property (nonatomic, assign) NSInteger nextPageNumber;
@property (nonatomic, assign) NSInteger totalPageNumber;

@end

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

- (void)loadData
{
  [self startWithCompletionBlockWithSuccess:^(__kindof HWBaseRequest * _Nonnull request) {

  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
    
  }];
}


- (void)loadNextPage
{
  [self start];
}



- (void)requestFailedPreprocessor
{

}

- (void)requestCompleteFilter
{
  
}

@end
