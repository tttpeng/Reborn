//
//  AppDelegate+ViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/21.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "AppDelegate+ViewController.h"
#import "HWVersionGuideViewController.h"
#import "HWMainTabViewController.h"


@implementation AppDelegate (ViewController)

- (void)setRootView
{
  NSString *showedVersion = [[NSUserDefaults standardUserDefaults] stringForKey:@"Version"];
  if (![[APP_VERSION substringToIndex:3] isEqualToString:[showedVersion substringToIndex:3]]) {
    [self showVersionGuide];
  }
  else {
    [self showHomeView];
  }
}

- (void)showHomeView
{
  HWMainTabViewController *main = [[HWMainTabViewController alloc] init];
  self.window.rootViewController = main;
}


- (void)showVersionGuide {
  HWVersionGuideViewController *controller = [[HWVersionGuideViewController alloc] init];
  self.window.rootViewController = controller;
  [[NSUserDefaults standardUserDefaults] setObject:APP_VERSION forKey:@"Version"];
  [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
