//
//  HWChainRequestAgent.h
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HWChainRequest;

///  HWChainRequestAgent handles chain request management. It keeps track of all
///  the chain requests.
@interface HWChainRequestAgent : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

///  Get the shared chain request agent.
+ (HWChainRequestAgent *)sharedAgent;

///  Add a chain request.
- (void)addChainRequest:(HWChainRequest *)request;

///  Remove a previously added chain request.
- (void)removeChainRequest:(HWChainRequest *)request;

@end

NS_ASSUME_NONNULL_END
