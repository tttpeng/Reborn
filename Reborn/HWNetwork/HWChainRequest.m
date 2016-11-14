//
//  HWChainRequest.m
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWChainRequest.h"
#import "HWChainRequestAgent.h"
#import "HWNetworkPrivate.h"
#import "HWBaseRequest.h"

@interface HWChainRequest()<HWRequestDelegate>

@property (strong, nonatomic) NSMutableArray<HWBaseRequest *> *requestArray;
@property (strong, nonatomic) NSMutableArray<HWChainCallback> *requestCallbackArray;
@property (assign, nonatomic) NSUInteger nextRequestIndex;
@property (strong, nonatomic) HWChainCallback emptyCallback;

@end

@implementation HWChainRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        _nextRequestIndex = 0;
        _requestArray = [NSMutableArray array];
        _requestCallbackArray = [NSMutableArray array];
        _emptyCallback = ^(HWChainRequest *chainRequest, HWBaseRequest *baseRequest) {
            // do nothing
        };
    }
    return self;
}

- (void)start {
    if (_nextRequestIndex > 0) {
        HWLog(@"Error! Chain request has already started.");
        return;
    }

    if ([_requestArray count] > 0) {
        [self toggleAccessoriesWillStartCallBack];
        [self startNextRequest];
        [[HWChainRequestAgent sharedAgent] addChainRequest:self];
    } else {
        HWLog(@"Error! Chain request array is empty.");
    }
}

- (void)stop {
    [self toggleAccessoriesWillStopCallBack];
    [self clearRequest];
    [[HWChainRequestAgent sharedAgent] removeChainRequest:self];
    [self toggleAccessoriesDidStopCallBack];
}

- (void)addRequest:(HWBaseRequest *)request callback:(HWChainCallback)callback {
    [_requestArray addObject:request];
    if (callback != nil) {
        [_requestCallbackArray addObject:callback];
    } else {
        [_requestCallbackArray addObject:_emptyCallback];
    }
}

- (NSArray<HWBaseRequest *> *)requestArray {
    return _requestArray;
}

- (BOOL)startNextRequest {
    if (_nextRequestIndex < [_requestArray count]) {
        HWBaseRequest *request = _requestArray[_nextRequestIndex];
        _nextRequestIndex++;
        request.delegate = self;
        [request clearCompletionBlock];
        [request start];
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Network Request Delegate

- (void)requestFinished:(HWBaseRequest *)request {
    NSUInteger currentRequestIndex = _nextRequestIndex - 1;
    HWChainCallback callback = _requestCallbackArray[currentRequestIndex];
    callback(self, request);
    if (![self startNextRequest]) {
        [self toggleAccessoriesWillStopCallBack];
        if ([_delegate respondsToSelector:@selector(chainRequestFinished:)]) {
            [_delegate chainRequestFinished:self];
            [[HWChainRequestAgent sharedAgent] removeChainRequest:self];
        }
        [self toggleAccessoriesDidStopCallBack];
    }
}

- (void)requestFailed:(HWBaseRequest *)request {
    [self toggleAccessoriesWillStopCallBack];
    if ([_delegate respondsToSelector:@selector(chainRequestFailed:failedBaseRequest:)]) {
        [_delegate chainRequestFailed:self failedBaseRequest:request];
        [[HWChainRequestAgent sharedAgent] removeChainRequest:self];
    }
    [self toggleAccessoriesDidStopCallBack];
}

- (void)clearRequest {
    NSUInteger currentRequestIndex = _nextRequestIndex - 1;
    if (currentRequestIndex < [_requestArray count]) {
        HWBaseRequest *request = _requestArray[currentRequestIndex];
        [request stop];
    }
    [_requestArray removeAllObjects];
    [_requestCallbackArray removeAllObjects];
}

#pragma mark - Request Accessoies

- (void)addAccessory:(id<HWRequestAccessory>)accessory {
    if (!self.requestAccessories) {
        self.requestAccessories = [NSMutableArray array];
    }
    [self.requestAccessories addObject:accessory];
}

@end
