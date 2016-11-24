//
//  HWHomeStore.h
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWStore.h"
#import "HWHospitalViewModel.h"

@interface HWHomeStore : HWStore

@property (nonatomic, strong) NSArray *hospitals;

@property (nonatomic, strong) NSArray *hospitalViewModels;
@property (nonatomic, strong) HWHospitalViewModel *hospitalVieModel;

- (void)requestSubjectDataWithCallback:(void(^)())completion;
- (void)fetchDataWithViewModel:(id)viewModel;

//- (void)loadData;
//- (void)loadNextPage;

@end
