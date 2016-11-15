//
//  HWMainTabBarViewModel.m
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWMainTabBarViewModel.h"
#import "HWHomeViewController.h"
#import "HWCareViewController.h"
#import "HWMineViewController.h"

@interface HWMainTabBarViewModel ()

@property (nonatomic,strong) NSArray *tabInfoArray;
@property (nonatomic,strong) NSArray *tabClassArray;

@end

@implementation HWMainTabBarViewModel


- (id)init
{
  self = [super init];
  if (self) { 
    _tabClassArray = @[[HWHomeViewController class],
                       [HWCareViewController class],
                       [HWMineViewController class]];
    
    _tabInfoArray = @[@{@"image" : @"cure",  @"name" : @"首页"},
                      @{@"image" : @"focus", @"name" : @"关注"},
                      @{@"image" : @"mine",  @"name" : @"我的"}];
  }
  return self;
}

- (NSInteger)numberOfTabs
{
  return self.tabClassArray.count;
}

- (Class)tabClassAtIndex:(NSInteger)index
{
  return self.tabClassArray[index];
}

- (NSString *)tabImageNameAtIndex:(NSInteger)index{
  NSDictionary *tabItemDic = [_tabInfoArray objectAtIndex:index];
  return [NSString stringWithFormat:@"%@_normal",[tabItemDic objectForKey:@"image"]];
}

- (NSString *)tabImageHLNameAtIndex:(NSInteger)index{
  NSDictionary *tabItemDic = [_tabInfoArray objectAtIndex:index];
  return [NSString stringWithFormat:@"%@_selected",[tabItemDic objectForKey:@"image"]];
}

- (NSString *)tabTitleAtIndex:(NSInteger)index{
  NSDictionary *tabItemDic = [_tabInfoArray objectAtIndex:index];
  return [tabItemDic objectForKey:@"name"];
}

@end
