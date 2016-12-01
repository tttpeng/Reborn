//
//  HWHospitalViewModel.h
//  Reborn
//
//  Created by tpeng on 2016/12/1.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWViewModel.h"
#import "HWHomeStore.h"

@interface HWHospitalViewModel : HWViewModel

@property (nonatomic, weak) HWHomeStore *store;

- (NSURL *)hospitalPictureURLAtIndex:(NSInteger)index;
- (NSString *)hospitalNameAtIndex:(NSInteger)index;
- (NSString *)hospitalAddressAtIndex:(NSInteger)index;

@end
