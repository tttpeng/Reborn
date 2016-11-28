//
//  HWLoginManager.m
//  Reborn
//
//  Created by tpeng on 2016/11/28.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWLoginManager.h"

static NSString *userKey = @"userKey";
static NSString *tableName = @"userTable";
static NSString *dbName = @"userTable";
static NSString *tokenKey = @"tokenKey";




@interface HWLoginManager ()

@property (nonatomic, strong) HWKeyValueStore *userStore;

@end

@implementation HWLoginManager

+ (instancetype)shareInstance
{
  static dispatch_once_t onceToken;
  static id instance = nil;
  dispatch_once(&onceToken, ^{
    instance = [[[self class] alloc] init];
  });
  return instance;
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    
    NSDictionary *userDict = [self.userStore getObjectById:userKey fromTable:tableName];
    _user = [[HWUser alloc] initWithDictionary:userDict];
    _token = [self.userStore getStringById:tokenKey fromTable:tableName];
    if (!_user) {
      _user = [HWUser new];
    }
  }
  return self;
}

- (void)saveUser
{
  [self.userStore putObject:self.user.dictionary withId:userKey intoTable:tableName];
}

- (void)saveToken:(NSString *)token
{
  _token = token;
  [self.userStore putString:token withId:tokenKey intoTable:tableName];
}

- (BOOL)isLogin
{
  return self.user.Id.length > 0;
}

- (HWKeyValueStore *)userStore
{
  if (_userStore == nil) {
    _userStore = [[HWKeyValueStore alloc] initDBWithName:dbName];
    [_userStore createTableWithName:tableName];

  }
  return _userStore;
}

@end
