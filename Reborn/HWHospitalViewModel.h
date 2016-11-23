//
//  HWHospitalViewModel.h
//  Reborn
//
//  Created by tpeng on 2016/11/23.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWViewModel.h"
#import "HWHospital.h"

@interface HWHospitalViewModel : HWViewModel

@property (nonatomic, copy) NSURL *pictureURL;
@property (nonatomic, copy) NSString *hospitalName;
@property (nonatomic, copy) NSString *addressName;

- (instancetype)initWithHospital:(HWHospital *)hospital;
+ (instancetype)viewModelWith:(HWHospital *)hospital;

@end
