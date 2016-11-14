//
//  ViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/10.
//  Copyright © 2016年 tttpeng. All rights reserved.
//

#import "ViewController.h"
#import "HWRequestTestApi.h"
#import "HWRequestAApi.h"
#import "HWRequestBApi.h"
#import "HWRequestCApi.h"
#import "HWRequestDApi.h"
#import "HWWeiBoObject.h"
#import "HWBatchRequest.h"
#import "HWKeyValueStore.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
  button.backgroundColor = [UIColor redColor];
  [self.view addSubview:button];
  [button addTarget:self action:@selector(testKeyValueStore) forControlEvents:UIControlEventTouchUpInside];
  
}

- (void)testKeyValueStore
{
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:path];
  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
  
//  HWWeiboStatus *status = [[HWWeiboStatus alloc] initWithDictionary:json];

  HWKeyValueStore *store = [[HWKeyValueStore alloc] initDBWithName:@"test.db"];
  [store createTableWithName:@"weibo"];
  [store putObject:json withId:@"123" intoTable:@"weibo"];}

- (void)testModel
{
  NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:path];
  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
  
  HWWeiboStatus *status = [[HWWeiboStatus alloc] initWithDictionary:json];
  NSLog(@"%@",[status description]);
  
}

- (void)testRequest
{
  
  HWRequestTestApi *testApi = [[HWRequestTestApi alloc] init];
  HWRequestAApi *testApi1 = [[HWRequestAApi alloc] init];
  HWRequestBApi *testApi2 = [[HWRequestBApi  alloc] init];
  HWRequestCApi *testApi3 = [[HWRequestCApi alloc] init];
  HWRequestDApi *testApi4 = [[HWRequestDApi alloc] init];


  
  HWBatchRequest *batchRequest = [[HWBatchRequest alloc] initWithRequestArray:@[testApi,testApi1,testApi2,testApi3,testApi4]];
  [batchRequest startWithCompletionBlockWithSuccess:^(HWBatchRequest * _Nonnull batchRequest) {
    NSLog(@"success");
  } failure:^(HWBatchRequest * _Nonnull batchRequest) {
    
  }];

  
  
//  [testApi startWithCompletionBlockWithSuccess:^(__kindof HWBaseRequest * _Nonnull request) {
//    
//  } failure:^(__kindof HWBaseRequest * _Nonnull request) {
//    
//  }];

}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
