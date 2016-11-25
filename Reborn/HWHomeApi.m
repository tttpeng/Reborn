//
//  HWHomeApi.m
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeApi.h"
#import "HWHospital.h"

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
  return @{@"pageIndex":@(_nextPageNumber)};
}


- (void)loadDataSuccess:(void(^)(BOOL success))completion
{
  completion(YES);
}

- (void)loadDataWithCompletionBlockWithSuccess:(HWHomeApiCompletionBlock)success
                                       failure:(HWHomeApiFailureBlock)failure
{
  self.nextPageNumber = 19;
  [self startWithCompletionBlockWithSuccess:^(__kindof HWBaseRequest * _Nonnull request) {
    NSArray *hospitals = [HWHospital arrayOfModelsFromDictionaries:request.responseJSONObject[@"data"][@"sourceItems"]];
    success(hospitals);
  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
    success(@[]);
  }];
}


- (void)loadNextPageWithCompletionBlockWithSuccess:(HWHomeApiCompletionBlock)success
                                           failure:(HWHomeApiFailureBlock)failure
{
  [self startWithCompletionBlockWithSuccess:^(__kindof HWBaseRequest * _Nonnull request) {
    NSArray *hospitals = [HWHospital arrayOfModelsFromDictionaries:request.responseJSONObject[@"data"][@"sourceItems"]];
    success(hospitals);
  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
    failure(request);
  }];
}




- (void)requestCompleteFilter
{
  self.nextPageNumber++;
}

@end
