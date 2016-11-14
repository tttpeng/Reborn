//
//  HWBatchRequest.h
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HWRequest;
@class HWBatchRequest;
@protocol HWRequestAccessory;

///  The HWBatchRequestDelegate protocol defines several optional methods you can use
///  to receive network-related messages. All the delegate methods will be called
///  on the main queue. Note the delegate methods will be called when all the requests
///  of batch request finishes.
@protocol HWBatchRequestDelegate <NSObject>

@optional
///  Tell the delegate that the batch request has finished successfully/
///
///  @param batchRequest The corresponding batch request.
- (void)batchRequestFinished:(HWBatchRequest *)batchRequest;

///  Tell the delegate that the batch request has failed.
///
///  @param batchRequest The corresponding batch request.
- (void)batchRequestFailed:(HWBatchRequest *)batchRequest;

@end

///  HWBatchRequest can be used to batch several HWRequest. Note that when used inside HWBatchRequest, a single
///  HWRequest will have its own callback and delegate cleared, in favor of the batch request callback.
@interface HWBatchRequest : NSObject

///  All the requests are stored in this array.
@property (nonatomic, strong, readonly) NSArray<HWRequest *> *requestArray;

///  The delegate object of the batch request. Default is nil.
@property (nonatomic, weak, nullable) id<HWBatchRequestDelegate> delegate;

///  The success callback. Note this will be called only if all the requests are finished.
///  This block will be called on the main queue.
@property (nonatomic, copy, nullable) void (^successCompletionBlock)(HWBatchRequest *);

///  The failure callback. Note this will be called if one of the requests fails.
///  This block will be called on the main queue.
@property (nonatomic, copy, nullable) void (^failureCompletionBlock)(HWBatchRequest *);

///  Tag can be used to identify batch request. Default value is 0.
@property (nonatomic) NSInteger tag;

///  This can be used to add several accossories object. Note if you use `addAccessory` to add acceesory
///  this array will be automatically created. Default is nil.
@property (nonatomic, strong, nullable) NSMutableArray<id<HWRequestAccessory>> *requestAccessories;

///  The first request that failed (and causing the batch request to fail).
@property (nonatomic, strong, readonly, nullable) HWRequest *failedRequest;

///  Creates a `HWBatchRequest` with a bunch of requests.
///
///  @param requestArray requests useds to create batch request.
///
- (instancetype)initWithRequestArray:(NSArray<HWRequest *> *)requestArray;

///  Set completion callbacks
- (void)setCompletionBlockWithSuccess:(nullable void (^)(HWBatchRequest *batchRequest))success
                              failure:(nullable void (^)(HWBatchRequest *batchRequest))failure;

///  Nil out both success and failure callback blocks.
- (void)clearCompletionBlock;

///  Convenience method to add request accessory. See also `requestAccessories`.
- (void)addAccessory:(id<HWRequestAccessory>)accessory;

///  Append all the requests to queue.
- (void)start;

///  Stop all the requests of the batch request.
- (void)stop;

///  Convenience method to start the batch request with block callbacks.
- (void)startWithCompletionBlockWithSuccess:(nullable void (^)(HWBatchRequest *batchRequest))success
                                    failure:(nullable void (^)(HWBatchRequest *batchRequest))failure;

///  Whether all response data is from local cache.
- (BOOL)isDataFromCache;

@end

NS_ASSUME_NONNULL_END
