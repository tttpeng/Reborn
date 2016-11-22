//
//  HWHospital.h
//  Reborn
//
//  Created by tpeng on 2016/11/22.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWObject.h"

@interface HWHospital : HWObject

@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *hospitalId;
@property (nonatomic, copy) NSString *hospitalName;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *pinyinName;

@end
