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


- (void)loadNewDataWithCallback:(void (^)())success failure:(HWStoreErrorBlock)failure
{
  [self.api loadDataWithCompletionBlockWithSuccess:^(NSArray * _Nullable hospitals) {
    NSMutableArray *array = [NSMutableArray array];
    for (HWHospital *hospital in hospitals) {
      HWHospitalViewModel *viewModel = [HWHospitalViewModel viewModelWith:hospital];
      [array addObject:viewModel];
    }
    _hospitalViewModels = array;
    
    success();
  } failure:^(NSString *errorMessage, NSInteger errorCode) {
    failure(HWStoreErrorTypeNone,errorMessage);
  }];
}


//五种状态的切换


- (void)loadMoreDataWithCallBack:(void (^)())success failure:(HWStoreErrorBlock)failure
{
  
  [self.api loadNextPageWithCompletionBlockWithSuccess:^(NSArray *hospitals, BOOL isHaveNextPage) {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.hospitalViewModels];
    for (HWHospital *hospital in hospitals) {
      HWHospitalViewModel *viewModel = [HWHospitalViewModel viewModelWith:hospital];
      [array addObject:viewModel];
    }
    _hospitalViewModels = array;
    success();
  } failure:^(NSString *errorMessage, NSInteger errorCode) {
    if (errorCode == HWRequestValidationErrorInvalidNoContent) {
      failure(HWStoreErrorTypeNoNextPage,errorMessage);
      return;
    }
    failure(HWStoreErrorTypeNone,errorMessage);
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
