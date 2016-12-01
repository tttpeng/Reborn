//
//  HWHomeViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeViewController.h"
#import "HWHomeTableViewController.h"
#import "HWLoginManager.h"

@interface HWHomeViewController ()

@end

@implementation HWHomeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setNavigateTitle:@"首页" rightButtonTitle:@"添加"];
  
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
  button.backgroundColor = MAIN_VISUAL_COLOR;
  [button setTitle:@"Push" forState:UIControlStateNormal];
  [self.view addSubview:button];
  
  [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
  
  [button mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.view);
    make.top.equalTo(self.view).offset(200);
  }];
  
  
  
//  HWUser *user = [HWLoginManager shareInstance].user;
//  user.Id = @"123";
//  user.nickName = @"asd";
//  [[HWLoginManager shareInstance] saveUser];
//  
  NSLog(@"%@",[HWLoginManager shareInstance].user);
//  [[HWLoginManager shareInstance] saveToken:@"tttoken123123123"];
  
}


- (void)push
{
  HWHomeTableViewController *controller = [[HWHomeTableViewController alloc] init];
  [self pushViewController:controller];
}



- (void)rightButtonClicked:(UIButton *)button
{
  NSLog(@"添加按钮点击事件");
}


@end
