//
//  HWHomeStore.m
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeStore.h"
#import "HWHomeApi.h"
#import "HWHospitalViewModel.h"

@interface HWHomeStore ()

@property (nonatomic, strong) HWHomeApi *api;

@end

@implementation HWHomeStore

- (void)loadNewDataWithCallBack:(HWStoreCallBackBlock)callback
{
  [self.api loadDataWithCompletionBlockWithSuccess:^(NSArray * _Nullable hospitals) {
    _hospitals = hospitals;
    callback(HWStoreDataStateNormal,nil);;
  } failure:^(NSInteger errorCode, NSString *errorMessage) {
    callback(HWStoreDataStateNoContent,errorMessage);
  }];
}

- (void)loadMoreDataWithCallBack:(HWStoreCallBackBlock)callback
{
  [self.api loadNextPageWithCompletionBlockWithSuccess:^(NSArray *hospitals, BOOL isHaveNextPage) {
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.hospitals];
    [tempArray addObjectsFromArray:hospitals];
    _hospitals = tempArray;
    callback(HWStoreDataStateNormal,nil);
  } failure:^(NSInteger errorCode, NSString *errorMessage) {
    if (errorCode == HWRequestValidationErrorInvalidNoContent) {
      callback(HWStoreDataStateNoNextPage,errorMessage);
      return;
    }
    callback(HWStoreDataStateNoContent,errorMessage);
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
