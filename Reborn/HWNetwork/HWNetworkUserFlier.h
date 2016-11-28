//
//  HWNetworkUserFlier.h
//  Reborn
//
//  Created by tpeng on 2016/11/28.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWNetworkConfig.h"


/**
 网络请求添加用户信息的过滤器，可扩展，如用户信息，用户地理位置，用户设备信息等；
 */
@interface HWNetworkUserFlier : NSObject<HWNetworkFilterProtocol>


@end
