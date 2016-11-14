//
//  HWMainTabBarViewModel.h
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWMainTabBarViewModel : NSObject


- (NSInteger)numberOfTabs;

- (Class)tabClassAtIndex:(NSInteger)index;
- (NSString *)tabImageNameAtIndex:(NSInteger)index;
- (NSString *)tabImageHLNameAtIndex:(NSInteger)index;
- (NSString *)tabTitleAtIndex:(NSInteger)index;

@end
