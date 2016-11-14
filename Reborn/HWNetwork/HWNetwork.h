//
//  HWNetwork.h
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef _HWNETWORK_
    #define _HWNETWORK_

#if __has_include(<HWNetwork/HWNetwork.h>)

    FOUNDATION_EXPORT double HWNetworkVersionNumber;
    FOUNDATION_EXPORT const unsigned char HWNetworkVersionString[];

    #import <HWNetwork/HWRequest.h>
    #import <HWNetwork/HWBaseRequest.h>
    #import <HWNetwork/HWNetworkAgent.h>
    #import <HWNetwork/HWBatchRequest.h>
    #import <HWNetwork/HWBatchRequestAgent.h>
    #import <HWNetwork/HWChainRequest.h>
    #import <HWNetwork/HWChainRequestAgent.h>
    #import <HWNetwork/HWNetworkConfig.h>

#else

    #import "HWRequest.h"
    #import "HWBaseRequest.h"
    #import "HWNetworkAgent.h"
    #import "HWBatchRequest.h"
    #import "HWBatchRequestAgent.h"
    #import "HWChainRequest.h"
    #import "HWChainRequestAgent.h"
    #import "HWNetworkConfig.h"

#endif /* __has_include */

#endif /* _HWNETWORK_ */
