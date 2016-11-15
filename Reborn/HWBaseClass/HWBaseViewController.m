//
//  HWBaseViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWBaseViewController.h"
#import "HWNavigationBarButton.h"

@interface HWBaseViewController ()

@end

@implementation HWBaseViewController


- (instancetype)init
{
  // 在init方法里调用 initWithNibName:bundle，保证了 HWBaseViewController 里的 initWithNibName 不会再次被调用，也就是保证了 initController 方法不会被调用两次
  self = [super initWithNibName:nil bundle:nil];
  if (self) {
    [self initController];
  }
  return self;
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  [self initController];
  return self;

}

- (void)initController
{
  
}


- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
  self.edgesForExtendedLayout = UIRectEdgeAll;

  [self setupBackButtonItem];
  [self hideLeftButtonForRootController];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  // 如果栈内的层级多于一个，隐藏UITabBar
  if (self.navigationController.childViewControllers.count >= 1){
    [self setHidesBottomBarWhenPushed:YES];
  }
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
  // 如果栈内的层级小于等于两个，取消隐藏下面的tabbar
  if (self.navigationController.childViewControllers.count <= 2) {
    [self setHidesBottomBarWhenPushed:NO];
  }
}


#pragma mark - 导航
- (void)setNavigateTitle:(NSString *)title rightButtonTitle:(NSString *)rightButtonTitle
{
  HWNavigationBarButton *rightButton = [[HWNavigationBarButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
  rightButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
  rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
  [rightButton setTitleColor:MAIN_VISUAL_COLOR forState:UIControlStateNormal];
  [rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
  [rightButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

  UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
  [self.navigationItem setRightBarButtonItems:@[rightButtonItem]];
  self.navigationItem.title = title;
}

- (void)setupBackButtonItem
{
  HWNavigationBarButton *backButton = [[HWNavigationBarButton alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
  backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
  [backButton setImage:[UIImage imageNamed:@"back1"] forState:UIControlStateNormal];
  [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
  UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
  self.navigationItem.leftBarButtonItem = backButtonItem;
}

- (void)hideLeftButtonForRootController {
  if (self.navigationController.viewControllers.count == 1) {
    [self.navigationItem setLeftBarButtonItem:nil];
  }
}

- (void)rightButtonClicked:(UIButton *)button {}

- (void)backAction:(UIButton *)button {
  if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
    UINavigationController *navigation = (UINavigationController *)self.parentViewController;
    NSArray *controllers = navigation.viewControllers;
    if (self.presentingViewController && controllers.count == 1) {
      [self dismissViewControllerAnimated:YES completion:nil];
    }else{
      [self.navigationController popViewControllerAnimated:YES];
    }
  }else{
    [self dismissViewControllerAnimated:YES completion:nil];
  }
}

- (void)pushViewController:(UIViewController *)controller {
  [self.navigationController pushViewController:controller animated:YES];
}


@end
