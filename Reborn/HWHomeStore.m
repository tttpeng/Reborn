//
//  HWHomeStore.m
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeStore.h"
#import "HWHomeApi.h"
#import "HWHospital.h"
#import "HWHospitalViewModel.h"

@interface HWHomeStore ()

@property (nonatomic, strong) HWHomeApi *api;

@end

@implementation HWHomeStore

-(void)fetchDataWithViewModel:(id)viewModel
{
  
}


- (void)loadNewDataWithCallBack:(void(^)(NSString *errorMessage))completion
{
  [self.api loadDataWithCompletionBlockWithSuccess:^(NSArray * _Nullable hospitals) {
    NSMutableArray *array = [NSMutableArray array];
    for (HWHospital *hospital in hospitals) {
      HWHospitalViewModel *viewModel = [HWHospitalViewModel viewModelWith:hospital];
      [array addObject:viewModel];
    }
    _hospitalViewModels = array;
    completion(nil);
  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
    completion(request.error.userInfo[@"errorMessage"]);
  }];
}

- (void)loadMoreDataWithCallBack:(void(^)(NSString *errorMessage, BOOL hasNextPage))completion
{
  [self.api loadNextPageWithCompletionBlockWithSuccess:^(NSArray * _Nullable hospitals) {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.hospitalViewModels];
    for (HWHospital *hospital in hospitals) {
      HWHospitalViewModel *viewModel = [HWHospitalViewModel viewModelWith:hospital];
      [array addObject:viewModel];
    }
    _hospitalViewModels = array;
    BOOL hasNexPage = YES;
    if (hospitals.count < 20) {
      hasNexPage = NO;
    }
    completion(nil,hasNexPage);
  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
    completion(request.error.userInfo[@"errorMessage"],NO);
  }];
}


- (HWHomeApi *)api
{
  if (_api == nil) {
    _api = [[HWHomeApi alloc] init];
  }
  return _api;
}

@end
