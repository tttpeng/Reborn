//
//  HWNetworkLogger.h
//  Reborn
//
//  Created by tpeng on 2016/11/25.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HWBaseRequest;

@interface HWNetworkLogger : NSObject

//+ (void)logDebugInfoWithRequest:(NSURLRequest *)request apiName:(NSString *)apiName service:(CTService *)service requestParams:(id)requestParams httpMethod:(NSString *)httpMethod;
//+ (void)logDebugInfoWithResponse:(NSHTTPURLResponse *)response responseString:(NSString *)responseString request:(NSURLRequest *)request error:(NSError *)error;
+ (void)logRequestDebugInfoWithRequest:(HWBaseRequest *)request;
+ (void)logResponseDebugInfoWithRequest:(HWBaseRequest *)request;


@end
