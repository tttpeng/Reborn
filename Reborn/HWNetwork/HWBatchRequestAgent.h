//
//  HWBatchRequestAgent.h
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HWBatchRequest;

///  HWBatchRequestAgent handles batch request management. It keeps track of all
///  the batch requests.
@interface HWBatchRequestAgent : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

///  Get the shared batch request agent.
+ (HWBatchRequestAgent *)sharedAgent;

///  Add a batch request.
- (void)addBatchRequest:(HWBatchRequest *)request;

///  Remove a previously added batch request.
- (void)removeBatchRequest:(HWBatchRequest *)request;

@end

NS_ASSUME_NONNULL_END
