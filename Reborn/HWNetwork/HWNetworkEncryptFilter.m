//
//  HWUrlArgumentsFilter.m
//  Reborn
//
//  Created by tpeng on 2016/11/25.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWNetworkEncryptFilter.h"
#import "HWRequest.h"
#import "AESCipher.h"

@implementation HWNetworkEncryptFilter

- (NSDictionary *)commonRequestHeadersWithRequest:(HWBaseRequest *)request
{
  return @{@"userId":@"userId"};
}

- (NSData *)beforePerformCompleteWithRequest:(HWBaseRequest *)request
{
  NSString *userId = request.currentRequest.allHTTPHeaderFields[@"userId"];
  
  NSString *encryptionKey =  [[[NSString stringWithFormat:@"%@%@",@"zhongmeban",userId] md5] substringWithRange:NSMakeRange(8,16)];
  
  NSString *encryptedString = [[NSString alloc] initWithData:request.responseObject
                                                    encoding:NSUTF8StringEncoding];
  
  NSString *dencryptedString = [AESCipher decryptAES:encryptedString key:encryptionKey];
  
  return [dencryptedString dataUsingEncoding:NSUTF8StringEncoding];
}

@end
