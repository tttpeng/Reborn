//
//  HWLoginManager.h
//  Reborn
//
//  Created by tpeng on 2016/11/28.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWUser.h"
#import "HWKeyValueStore.h"

@interface HWLoginManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, readonly) HWUser *user;
@property (nonatomic, readonly) NSString *token;

@property (nonatomic, assign, readonly) BOOL isLogin;

- (void)saveUser;
- (void)saveToken:(NSString *)token;

@end
