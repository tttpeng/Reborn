//
//  HWUser.h
//  Reborn
//
//  Created by tpeng on 2016/11/28.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWObject.h"

@interface HWUser : HWObject

@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *phone;


@end
