//
//  HWObject.h
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWObject : NSObject<NSCoding, NSCopying>

/**  @brief  根据字典转相应的对象 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**  @brief  对象转成字典 */
- (NSDictionary *)dictionary;

/**  @brief  Model 属性名和字典中的 Key 不相同 */
+ (NSDictionary *)modelCustomPropertyMapper;

/**
 当 Model 中有容器类属性需要映射 Model 时实现该方法
 
 @return Example: @{@"shadows"     : [Shadow class],
                    @"borders"     : Border.class,
                    @"attachments" : @"Attachment" };
 */
+ (NSDictionary *)modelContainerPropertyGenericClass;

/**
 转模型黑名单，实现该方法处理过程中忽略该列表内的所有属性

 @return Example: @[@"test1", @"test2"];
 */
+ (NSArray *)modelPropertyBlacklist;

/**
 转模型白名单，如果实现了该方法，则处理过程中不会处理该列表外的属性。
 
 @return Example: @[@"name"];
 */
+ (NSArray *)modelPropertyWhitelist;


/**  @brief  字典数组转 Model 数组 */
+ (NSArray *)arrayOfModelsFromDictionaries:(NSArray*)array;

/**  @brief  Model 数组转字典数组 */
+ (NSArray *)arrayOfDictionariesFromModels:(NSArray *)array;




@end
