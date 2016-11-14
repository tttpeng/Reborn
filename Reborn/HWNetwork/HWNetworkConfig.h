//
//  HWNetworkConfig.h
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HWBaseRequest;
@class AFSecurityPolicy;

///  HWUrlFilterProtocol can be used to append common parameters to requests before sending them.
@protocol HWUrlFilterProtocol <NSObject>
///  Preprocess request URL before actually sending them.
///
///  @param originUrl request's origin URL, which is returned by `requestUrl`
///  @param request   request itself
///
///  @return A new url which will be used as a new `requestUrl`
- (NSString *)filterUrl:(NSString *)originUrl withRequest:(HWBaseRequest *)request;
@end

///  HWCacheDirPathFilterProtocol can be used to append common path components when caching response results
@protocol HWCacheDirPathFilterProtocol <NSObject>
///  Preprocess cache path before actually saving them.
///
///  @param originPath original base cache path, which is generated in `HWRequest` class.
///  @param request    request itself
///
///  @return A new path which will be used as base path when caching.
- (NSString *)filterCacheDirPath:(NSString *)originPath withRequest:(HWBaseRequest *)request;
@end

///  HWNetworkConfig stored global network-related configurations, which will be used in `HWNetworkAgent`
///  to form and filter requests, as well as caching response.
@interface HWNetworkConfig : NSObject

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

///  Return a shared config object.
+ (HWNetworkConfig *)sharedConfig;

///  Request base URL, such as "http://www.healthcare-works.com". Default is empty string.
@property (nonatomic, strong) NSString *baseUrl;
///  Request CDN URL. Default is empty string.
@property (nonatomic, strong) NSString *cdnUrl;
///  URL filters. See also `HWUrlFilterProtocol`.
@property (nonatomic, strong, readonly) NSArray<id<HWUrlFilterProtocol>> *urlFilters;
///  Cache path filters. See also `HWCacheDirPathFilterProtocol`.
@property (nonatomic, strong, readonly) NSArray<id<HWCacheDirPathFilterProtocol>> *cacheDirPathFilters;
///  Security policy will be used by AFNetworking. See also `AFSecurityPolicy`.
@property (nonatomic, strong) AFSecurityPolicy *securityPolicy;
///  Whether to log debug info. Default is NO;
@property (nonatomic) BOOL debugLogEnabled;
///  SessionConfiguration will be used to initialize AFHTTPSessionManager. Default is nil.
@property (nonatomic, strong) NSURLSessionConfiguration* sessionConfiguration;

///  Add a new URL filter.
- (void)addUrlFilter:(id<HWUrlFilterProtocol>)filter;
///  Remove all URL filters.
- (void)clearUrlFilter;
///  Add a new cache path filter
- (void)addCacheDirPathFilter:(id<HWCacheDirPathFilterProtocol>)filter;
///  Clear all cache path filters.
- (void)clearCacheDirPathFilter;

@end

NS_ASSUME_NONNULL_END
