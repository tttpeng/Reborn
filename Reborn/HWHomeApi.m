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
  self.nextPageNumber = 420;
  [self startWithCompletionBlockWithSuccess:^(__kindof HWBaseRequest * _Nonnull request) {
    NSArray *hospitals = [HWHospital arrayOfModelsFromDictionaries:request.responseJSONObject[@"data"][@"sourceItems"]];
    success(hospitals);
  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
    failure(request.error.code,nil);
  }];
}


- (void)loadNextPageWithCompletionBlockWithSuccess:(void (^)(NSArray *, BOOL))success
                                           failure:(HWHomeApiFailureBlock)failure
{
  [self startWithCompletionBlockWithSuccess:^(__kindof HWBaseRequest * _Nonnull request) {
    NSArray *hospitals = [HWHospital arrayOfModelsFromDictionaries:request.responseJSONObject[@"data"][@"sourceItems"]];
    success(hospitals,YES);
  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
    failure(request.error.code,nil);
  }];
}

- (BOOL)responseContentValidator
{
  NSArray *array = self.responseObject[@"data"][@"sourceItems"];
  if (array.count > 0) {
    return YES;
  }
  return NO;
}

- (void)requestCompleteFilter
{
  self.nextPageNumber++;
}

@end
