//
//  HWMainTabViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/14.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWMainTabViewController.h"
#import "HWMainTabBarViewModel.h"
#import "HWNavigationController.h"

@interface HWMainTabViewController ()

@property (nonatomic, strong) HWMainTabBarViewModel *viewModel;

@end

@implementation HWMainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupViewControllers{
  NSMutableArray *controllerArray = [[NSMutableArray alloc] init];
  for (NSInteger i = 0; i < [self.viewModel numberOfTabs]; i++) {
    //tabbar图片
    UIImage *tabImage = [UIImage imageNamed:[_viewModel tabImageNameAtIndex:i]];
    UIImage *tabHightlightImage = [UIImage imageNamed:[_viewModel tabImageHLNameAtIndex:i]];
    tabImage = [tabImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabHightlightImage = [tabHightlightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:[_viewModel tabTitleAtIndex:i] image:tabImage selectedImage:tabHightlightImage];
    
    // tab bar 图片偏移
    item.imageInsets = UIEdgeInsetsMake(-3, 0, 3, 0);
    Class controllerClass = [_viewModel tabClassAtIndex:i];
    UIViewController *controller = [[controllerClass alloc] init];
    controller.title = [_viewModel tabTitleAtIndex:i];
    controller.tabBarItem = item;
    HWNavigationController *navigationController = [[HWNavigationController alloc] initWithRootViewController:controller];
    [controllerArray addObject:navigationController];
  }
  [self setViewControllers:controllerArray];
}

@end
