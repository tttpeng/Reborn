//
//  HWHomeApi.h
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWRequest.h"

typedef void(^HWHomeApiCompletionBlock)( NSArray * hospitals);
typedef void(^HWHomeApiFailureBlock)(NSString *errorMessage, NSInteger errorCode);


@interface HWHomeApi : HWRequest


- (void)loadDataWithCompletionBlockWithSuccess:(HWHomeApiCompletionBlock)success
                                       failure:(HWHomeApiFailureBlock)failure;

- (void)loadNextPageWithCompletionBlockWithSuccess:(void(^)(NSArray *hospitals, BOOL isHaveNextPage))success
                                       failure:(HWHomeApiFailureBlock)failure;


@end
