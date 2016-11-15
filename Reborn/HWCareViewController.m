//
//  HWCareViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWCareViewController.h"
#import "HWNewTableViewController.h"

@interface HWCareViewController ()

@end

@implementation HWCareViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
  button.backgroundColor = MAIN_VISUAL_COLOR;
  [button setTitle:@"Push" forState:UIControlStateNormal];
  [self.view addSubview:button];
  
  [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];

  [button mas_makeConstraints:^(MASConstraintMaker *make) {
    make.centerX.equalTo(self.view);
    make.top.equalTo(self.view).offset(200);
  }];
  
  
}

- (void)push
{
  HWNewTableViewController *controller = [[HWNewTableViewController alloc] init];
  [self.navigationController pushViewController:controller animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
