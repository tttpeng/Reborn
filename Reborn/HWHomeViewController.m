//
//  HWHomeViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeViewController.h"

@interface HWHomeViewController ()

@end

@implementation HWHomeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setNavigateTitle:@"首页" rightButtonTitle:@"添加"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  
}



- (void)rightButtonClicked:(UIButton *)button
{
  NSLog(@"添加按钮点击事件");
}


@end
