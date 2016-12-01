//
//  HWPageStore.h
//  Reborn
//
//  Created by tpeng on 2016/12/1.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWStore.h"

typedef NS_ENUM(NSInteger,HWStoreDataState) {
  HWStoreDataStateNormal = 0,
  HWStoreDataStateNoContent = 1,
  HWStoreDataStateNoNextPage = 2,
};

typedef void(^HWStoreCallBackBlock)(HWStoreDataState state, NSString *errorMessage);

@interface HWPageStore : HWStore

- (void)loadNewDataWithCallBack:(HWStoreCallBackBlock)callback;
- (void)loadMoreDataWithCallBack:(HWStoreCallBackBlock)callback;


@end
