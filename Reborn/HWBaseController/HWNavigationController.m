//
//  HWNavigationController.m
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWNavigationController.h"

@interface HWNavigationController ()
<UIGestureRecognizerDelegate>

@end

@implementation HWNavigationController




- (void)viewDidLoad
{
  self.interactivePopGestureRecognizer.delegate = self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
  if ([self.childViewControllers count] == 1) {
    return NO;
  }
  return YES;
}


@end
