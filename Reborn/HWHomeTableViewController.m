//
//  HWHomeTableViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeTableViewController.h"
#import "HWHomeStore.h"

@interface HWHomeTableViewController ()

@property (nonatomic, strong) HWHomeStore *store;

@end

@implementation HWHomeTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setNavigateTitle:@"空列表" rightButtonTitle:@"添加"];
    // Do any additional setup after loading the view.
  _store = [[HWHomeStore alloc] init];
  [self.store requestSubjectDataWithCallback:^{
    
  }];
}


- (void)rightButtonClicked:(UIButton *)button
{
  NSLog(@"添加按钮被点击了");
}

- (void)emptyViewReladButtonDidTap
{
  NSLog(@"继续加载按钮被点击");
}


@end
