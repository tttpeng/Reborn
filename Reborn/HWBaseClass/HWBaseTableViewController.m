//
//  HWBaseTableViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWBaseTableViewController.h"

@interface HWBaseTableViewController ()

@end

@implementation HWBaseTableViewController

- (void)initController
{
  [super initController];
  _cellHeight = 44;  
}


- (void)viewDidLoad {
  [super viewDidLoad];
  self.automaticallyAdjustsScrollViewInsets = NO;
  _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 0) style:_tableStyle];
  _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  _tableView.rowHeight = _cellHeight;
  _tableView.delegate = self;
  _tableView.dataSource = self;
  
  if ([NSClassFromString(_cellIdentifier) isSubclassOfClass:[UITableViewCell class]]) {
    [_tableView registerClass:NSClassFromString(_cellIdentifier) forCellReuseIdentifier:_cellIdentifier];
  }
  
  [self.view addSubview:_tableView];
  _tableView.backgroundColor = [UIColor redColor];
  
  [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.view.mas_left);
    make.right.equalTo(self.view.mas_right);
    make.top.mas_equalTo(64);
    make.bottom.mas_equalTo(0);
  }];}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
  cell.backgroundColor = [UIColor randomColor];
  cell.textLabel.text = @"sad";
  return cell;
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
