//
//  HWHomeStore.h
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWStore.h"
#import "HWHospitalViewModel.h"

typedef NS_ENUM(NSInteger,HWStoreErrorType) {
  HWStoreErrorTypeNone = 0,
  HWStoreErrorTypeNoNextPage = 1,
};

typedef void(^HWStoreErrorBlock)(HWStoreErrorType type, NSString *errorMessage);

@interface HWHomeStore : HWStore

@property (nonatomic, strong) NSArray *hospitals;

@property (nonatomic, strong) NSArray *hospitalViewModels;
@property (nonatomic, strong) HWHospitalViewModel *hospitalVieModel;

@property (nonatomic, assign) BOOL isLoading;

- (void)loadNewDataWithCallback:(void(^)())success failure:(HWStoreErrorBlock)failure;
- (void)loadMoreDataWithCallBack:(void(^)())success failure:(HWStoreErrorBlock)failure;

//- (void)loadNewDataWithCallBack:(HWStoreCallBackBlock)completion;
//- (void)loadMoreDataWithCallBack:(HWStoreCallBackBlock)completion;

- (void)fetchDataWithViewModel:(id)viewModel;
//
//- (void)loadNewDataWithCallBack:(void(^)(NSString *errorMessage))completion;
//- (void)loadMoreDataWithCallBack:(void(^)(NSString *errorMessage, BOOL hasNextPage))completion;


//- (void)loadData;
//- (void)loadNextPage;

@end
