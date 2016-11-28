//
//  HWNetworkUserFlier.m
//  Reborn
//
//  Created by tpeng on 2016/11/28.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWNetworkUserFlier.h"
#import "HWLoginManager.h"

@implementation HWNetworkUserFlier


- (NSString *)filterUrl:(NSString *)originUrl withRequest:(HWBaseRequest *)request
{
  NSString *token = [HWLoginManager shareInstance].token;
  if (token.length > 0) {
    return [NSString stringWithFormat:@"%@?token=%@",originUrl,token];
  }
  return originUrl;
}


@end
