//
//  HWObject.m
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWObject.h"
#import <YYModel/YYModel.h>
#import "HWKeyValueStore.h"

@implementation HWObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    return [[self class] yy_modelWithDictionary:dictionary];
}

- (NSDictionary *)dictionary
{
  return [self yy_modelToJSONObject];
}

+ (NSDictionary *)modelCustomPropertyMapper {
  return nil;
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
  return nil;
}

+ (NSArray *)modelPropertyBlacklist {
  return nil;
}

+ (NSArray *)modelPropertyWhitelist {
  return nil;
}

- (NSString *)description {
  return [self yy_modelDescription];
}

- (BOOL)isEqual:(id)object {
  return [self yy_modelIsEqual:object];
}

- (NSUInteger)hash {
  return [self yy_modelHash];
}

+ (NSArray *)arrayOfModelsFromDictionaries:(NSArray *)array
{
  return [NSArray yy_modelArrayWithClass:[self class] json:array];
}

+ (NSArray *)arrayOfDictionariesFromModels:(NSArray *)array
{
  if (array.count == 0) {
    return  nil;
  }
  
  NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:array.count];
  for (HWObject *object in array) {
    [resultArray addObject:object.dictionary];
  }
  return resultArray;
}

- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { self = [super init]; return [self yy_modelInitWithCoder:aDecoder]; }
- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }



- (void)saveWithKey:(NSString *)key
{

  [[self class] description];
}


@end
