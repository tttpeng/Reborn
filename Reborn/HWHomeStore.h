//
//  HWHomeStore.h
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWPageStore.h"
#import "HWHospital.h"

@interface HWHomeStore : HWPageStore

@property (nonatomic, strong) NSArray *hospitals;

- (void)loadMoreDataWithCallBack:(HWStoreCallBackBlock)callback;
- (void)loadNewDataWithCallBack:(HWStoreCallBackBlock)callback;

@end
