//
//  HWChainRequestAgent.m
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWChainRequestAgent.h"
#import "HWChainRequest.h"

@interface HWChainRequestAgent()

@property (strong, nonatomic) NSMutableArray<HWChainRequest *> *requestArray;

@end

@implementation HWChainRequestAgent

+ (HWChainRequestAgent *)sharedAgent {
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

- (void)addChainRequest:(HWChainRequest *)request {
    @synchronized(self) {
        [_requestArray addObject:request];
    }
}

- (void)removeChainRequest:(HWChainRequest *)request {
    @synchronized(self) {
        [_requestArray removeObject:request];
    }
}

@end
