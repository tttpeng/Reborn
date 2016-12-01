//
//  HWMineViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWMineViewController.h"

@interface HWMineViewController ()<UIWebViewDelegate>

@end

@implementation HWMineViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
  NSLog(@"start");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
  NSLog(@"end");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
  NSLog(@"%@",error);
}




@end
