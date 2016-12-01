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


@end
