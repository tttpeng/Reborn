//
//  HWSearchViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/28.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWSearchViewController.h"

@interface HWSearchViewController ()

@end

@implementation HWSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
  [self.view addSubview:searchBar];

    
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
