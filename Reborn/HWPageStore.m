//
//  HWPageStore.m
//  Reborn
//
//  Created by tpeng on 2016/12/1.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWPageStore.h"

@implementation HWPageStore

- (void)loadNewDataWithCallBack:(HWStoreCallBackBlock)callback
{
  callback(HWStoreDataStateNormal,nil);
}

- (void)loadMoreDataWithCallBack:(HWStoreCallBackBlock)callback
{
  callback(HWStoreDataStateNormal,nil);
}

@end
