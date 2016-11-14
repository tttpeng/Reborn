//
//  HWBatchRequestAgent.m
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//
#import "HWBatchRequestAgent.h"
#import "HWBatchRequest.h"

@interface HWBatchRequestAgent()

@property (strong, nonatomic) NSMutableArray<HWBatchRequest *> *requestArray;

@end

@implementation HWBatchRequestAgent

+ (HWBatchRequestAgent *)sharedAgent {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _requestArray = [NSMutableArray array];
    }
    return self;
}

- (void)addBatchRequest:(HWBatchRequest *)request {
    @synchronized(self) {
        [_requestArray addObject:request];
    }
}

- (void)removeBatchRequest:(HWBatchRequest *)request {
    @synchronized(self) {
        [_requestArray removeObject:request];
    }
}

@end
