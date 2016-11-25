//
//  HWHomeApi.h
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWRequest.h"

typedef void(^HWHomeApiCompletionBlock)( NSArray * _Nullable hospitals);
typedef void(^HWHomeApiFailureBlock)(__kindof HWBaseRequest * _Nonnull request);


@interface HWHomeApi : HWRequest


- (void)loadDataWithCompletionBlockWithSuccess:(nullable HWHomeApiCompletionBlock)success
                                       failure:(nullable HWHomeApiFailureBlock)failure;

- (void)loadNextPageWithCompletionBlockWithSuccess:(nullable HWHomeApiCompletionBlock)success
                                       failure:(nullable HWHomeApiFailureBlock)failure;


@end
