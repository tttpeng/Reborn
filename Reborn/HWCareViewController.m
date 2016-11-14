//
//  HWCareViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWCareViewController.h"

@interface HWCareViewController ()

@end

@implementation HWCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = [UIColor greenColor];
  UIViewController *controller = [[UIViewController alloc] init];
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
