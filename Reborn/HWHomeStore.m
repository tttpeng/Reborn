//
//  HWHomeStore.m
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeStore.h"
#import "HWHomeApi.h"
#import "HWHospital.h"

@interface HWHomeStore ()

@property (nonatomic, strong) HWHomeApi *api;

@end

@implementation HWHomeStore

- (void)requestSubjectDataWithCallback:(void(^)())completion
{
  [self.api startWithCompletionBlockWithSuccess:^(__kindof HWBaseRequest * _Nonnull request) {
    NSLog(@"%@",request.responseString);
    NSLog(@"%@",request.responseObject);
    NSLog(@"%@",request.responseJSONObject);
    _hospitals = [HWHospital arrayOfModelsFromDictionaries:request.responseJSONObject[@"data"][@"sourceItems"]];
    NSLog(@"%@",_hospitals);
    completion();
    
  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
    
    completion();
    
  }];
}


- (HWHomeApi *)api
{
  if (_api == nil) {
    _api = [[HWHomeApi alloc] init];
  }
  return _api;
}

@end
