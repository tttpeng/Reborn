//
//  HWUrlArgumentsFilter.h
//  Reborn
//
//  Created by tpeng on 2016/11/25.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWNetworkConfig.h"

@interface HWNetworkEncryptFilter : NSObject <HWNetworkFilterProtocol>

- (NSDictionary *)commonRequestHeadersWithRequest:(HWBaseRequest *)request;
- (NSData *)beforePerformCompleteWithRequest:(HWBaseRequest *)request;

@end
