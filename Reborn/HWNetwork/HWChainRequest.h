//
//  HWChainRequest.h
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HWChainRequest;
@class HWBaseRequest;
@protocol HWRequestAccessory;

///  The HWChainRequestDelegate protocol defines several optional methods you can use
///  to receive network-related messages. All the delegate methods will be called
///  on the main queue. Note the delegate methods will be called when all the requests
///  of chain request finishes.
@protocol HWChainRequestDelegate <NSObject>

@optional
///  Tell the delegate that the chain request has finished successfully.
///
///  @param chainRequest The corresponding chain request.
- (void)chainRequestFinished:(HWChainRequest *)chainRequest;

///  Tell the delegate that the chain request has failed.
///
///  @param chainRequest The corresponding chain request.
///  @param request      First failed request that causes the whole request to fail.
- (void)chainRequestFailed:(HWChainRequest *)chainRequest failedBaseRequest:(HWBaseRequest*)request;

@end

typedef void (^HWChainCallback)(HWChainRequest *chainRequest, HWBaseRequest *baseRequest);

///  HWBatchRequest can be used to chain several HWRequest so that one will only starts after another finishes.
///  Note that when used inside HWChainRequest, a single HWRequest will have its own callback and delegate
///  cleared, in favor of the batch request callback.
@interface HWChainRequest : NSObject

///  All the requests are stored in this array.
- (NSArray<HWBaseRequest *> *)requestArray;

///  The delegate object of the chain request. Default is nil.
@property (nonatomic, weak, nullable) id<HWChainRequestDelegate> delegate;

///  This can be used to add several accossories object. Note if you use `addAccessory` to add acceesory
///  this array will be automatically created. Default is nil.
@property (nonatomic, strong, nullable) NSMutableArray<id<HWRequestAccessory>> *requestAccessories;

///  Convenience method to add request accessory. See also `requestAccessories`.
- (void)addAccessory:(id<HWRequestAccessory>)accessory;

///  Start the chain request, adding first request in the chain to request queue.
- (void)start;

///  Stop the chain request. Remaining request in chain will be cancelled.
- (void)stop;

///  Add request to request chain.
///
///  @param request  The request to be chained.
///  @param callback The finish callback
- (void)addRequest:(HWBaseRequest *)request callback:(nullable HWChainCallback)callback;

@end

NS_ASSUME_NONNULL_END
