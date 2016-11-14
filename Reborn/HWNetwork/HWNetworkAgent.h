//
//  HWNetworkAgent.h
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HWBaseRequest;

///  HWNetworkAgent is the underlying class that handles actual request generation,
///  serialization and response handling.
@interface HWNetworkAgent : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

///  Get the shared agent.
+ (HWNetworkAgent *)sharedAgent;

///  Add request to session and start it.
- (void)addRequest:(HWBaseRequest *)request;

///  Cancel a request that was previously added.
- (void)cancelRequest:(HWBaseRequest *)request;

///  Cancel all requests that were previously added.
- (void)cancelAllRequests;

///  Return the constructed URL of request.
///
///  @param request The request to parse. Should not be nil.
///
///  @return The result URL.
- (NSString *)buildRequestUrl:(HWBaseRequest *)request;

@end

NS_ASSUME_NONNULL_END
