//
//  HWVersionGuideViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/21.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWVersionGuideViewController.h"
#import <EAIntroView/EAIntroView.h>
#import "AppDelegate.h"
#import "AppDelegate+ViewController.h"

@interface HWVersionGuideViewController ()
<EAIntroDelegate>

@end

@implementation HWVersionGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
  NSArray *imageArray = @[@"001",@"002",@"003"];
  
  
  NSMutableArray *pageArray = [NSMutableArray arrayWithCapacity:imageArray.count];
  for (NSString *imageName in imageArray) {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:imageName];
    EAIntroPage *page = [EAIntroPage pageWithCustomView:imageView];
    [pageArray addObject:page];
  }

  EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:pageArray];
  intro.swipeToExit = NO;
  intro.showSkipButtonOnlyOnLastPage = YES;

  intro.pageControlY = 42.f;
  intro.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
  intro.pageControl.pageIndicatorTintColor = [UIColor grayColor];
  
  intro.skipButtonAlignment = EAViewAlignmentCenter;
  intro.skipButtonY = 120.f;
  intro.skipButton.layer.cornerRadius = 3;
  intro.skipButton.layer.borderWidth =1;
  intro.skipButton.layer.borderColor = [UIColor orangeColor].CGColor;
  [intro.skipButton setTitle:@"立即体验" forState: UIControlStateNormal];
  [intro.skipButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
  [intro.skipButton addTarget:self action:@selector(enterIntoHome) forControlEvents:UIControlEventTouchUpInside];
  [intro showInView:self.view animateDuration:0.3];

}

- (void)enterIntoHome
{ 
  [[AppDelegate shareInstance] showHomeView];
}



@end
