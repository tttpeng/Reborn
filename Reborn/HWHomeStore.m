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
#import "HWHospitalViewModel.h"

@interface HWHomeStore ()

@property (nonatomic, strong) HWHomeApi *api;

@end

@implementation HWHomeStore

-(void)fetchDataWithViewModel:(id)viewModel
{
  
}

- (void)requestSubjectDataWithCallback:(void(^)())completion
{
  [self.api startWithCompletionBlockWithSuccess:^(__kindof HWBaseRequest * _Nonnull request) {
    NSLog(@"%@",request.responseString);
    NSLog(@"%@",request.responseObject);
    NSLog(@"%@",request.responseJSONObject);
    _hospitals = [HWHospital arrayOfModelsFromDictionaries:request.responseJSONObject[@"data"][@"sourceItems"]];
    
    NSMutableArray *array = [NSMutableArray array];
    for (HWHospital *hospital in self.hospitals) {
      HWHospitalViewModel *viewModel = [[HWHospitalViewModel alloc] initWithHospital:hospital];
      [array addObject:viewModel];
    }
    _hospitalViewModels = array;
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
