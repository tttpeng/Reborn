//
//  HWHomeStore.h
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWStore.h"

@interface HWHomeStore : HWStore

@property (nonatomic, strong) NSArray *hospitals;

- (void)requestSubjectDataWithCallback:(void(^)())completion;

@end
