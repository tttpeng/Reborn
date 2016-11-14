//
//  HWBatchRequest.m
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWBatchRequest.h"
#import "HWNetworkPrivate.h"
#import "HWBatchRequestAgent.h"
#import "HWRequest.h"

@interface HWBatchRequest() <HWRequestDelegate>

@property (nonatomic) NSInteger finishedCount;

@end

@implementation HWBatchRequest

- (instancetype)initWithRequestArray:(NSArray<HWRequest *> *)requestArray {
    self = [super init];
    if (self) {
        _requestArray = [requestArray copy];
        _finishedCount = 0;
        for (HWRequest * req in _requestArray) {
            if (![req isKindOfClass:[HWRequest class]]) {
                HWLog(@"Error, request item must be HWRequest instance.");
                return nil;
            }
        }
    }
    return self;
}

- (void)start {
    if (_finishedCount > 0) {
        HWLog(@"Error! Batch request has already started.");
        return;
    }
    _failedRequest = nil;
    [[HWBatchRequestAgent sharedAgent] addBatchRequest:self];
    [self toggleAccessoriesWillStartCallBack];
    for (HWRequest * req in _requestArray) {
        req.delegate = self;
        [req clearCompletionBlock];
        [req start];
    }
}

- (void)stop {
    [self toggleAccessoriesWillStopCallBack];
    _delegate = nil;
    [self clearRequest];
    [self toggleAccessoriesDidStopCallBack];
    [[HWBatchRequestAgent sharedAgent] removeBatchRequest:self];
}

- (void)startWithCompletionBlockWithSuccess:(void (^)(HWBatchRequest *batchRequest))success
                                    failure:(void (^)(HWBatchRequest *batchRequest))failure {
    [self setCompletionBlockWithSuccess:success failure:failure];
    [self start];
}

- (void)setCompletionBlockWithSuccess:(void (^)(HWBatchRequest *batchRequest))success
                              failure:(void (^)(HWBatchRequest *batchRequest))failure {
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}

- (void)clearCompletionBlock {
    // nil out to break the retain cycle.
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
}

- (BOOL)isDataFromCache {
    BOOL result = YES;
    for (HWRequest *request in _requestArray) {
        if (!request.isDataFromCache) {
            result = NO;
        }
    }
    return result;
}


- (void)dealloc {
    [self clearRequest];
}

#pragma mark - Network Request Delegate

- (void)requestFinished:(HWRequest *)request {
    _finishedCount++;
    if (_finishedCount == _requestArray.count) {
        [self toggleAccessoriesWillStopCallBack];
        if ([_delegate respondsToSelector:@selector(batchRequestFinished:)]) {
            [_delegate batchRequestFinished:self];
        }
        if (_successCompletionBlock) {
            _successCompletionBlock(self);
        }
        [self clearCompletionBlock];
        [self toggleAccessoriesDidStopCallBack];
        [[HWBatchRequestAgent sharedAgent] removeBatchRequest:self];
    }
}

- (void)requestFailed:(HWRequest *)request {
    _failedRequest = request;
    [self toggleAccessoriesWillStopCallBack];
    // Stop
    for (HWRequest *req in _requestArray) {
        [req stop];
    }
    // Callback
    if ([_delegate respondsToSelector:@selector(batchRequestFailed:)]) {
        [_delegate batchRequestFailed:self];
    }
    if (_failureCompletionBlock) {
        _failureCompletionBlock(self);
    }
    // Clear
    [self clearCompletionBlock];

    [self toggleAccessoriesDidStopCallBack];
    [[HWBatchRequestAgent sharedAgent] removeBatchRequest:self];
}

- (void)clearRequest {
    for (HWRequest * req in _requestArray) {
        [req stop];
    }
    [self clearCompletionBlock];
}

#pragma mark - Request Accessoies

- (void)addAccessory:(id<HWRequestAccessory>)accessory {
    if (!self.requestAccessories) {
        self.requestAccessories = [NSMutableArray array];
    }
    [self.requestAccessories addObject:accessory];
}

@end
