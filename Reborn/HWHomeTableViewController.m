//
//  HWHomeTableViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWHomeTableViewController.h"
#import "HWHomeStore.h"
#import "HWHospitalCell.h"
#import "HWHospitalViewModel.h"

@interface HWHomeTableViewController ()

@property (nonatomic, strong) HWHomeStore *store;

@end

@implementation HWHomeTableViewController

- (void)initController
{
  [super initController];
  self.cellIdentifier = @"HWHospitalCell";
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setNavigateTitle:@"空列表" rightButtonTitle:@"添加"];
  _store = [[HWHomeStore alloc] init];
  
  [self.store loadNewDataWithCallBack:^(NSString *errorMessage) {
    [self.tableView reloadData];
  }];
  //  [self.tableView registerClass:[HWHospitalCell class] forCellReuseIdentifier:@"key"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.store.hospitalViewModels.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//  HWHospitalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"key"];
//  return cell;
//}

- (void)configDataForCell:(HWHospitalCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
//  HWHospitalViewModel *viewModel = [[HWHospitalViewModel alloc] initWithHospital:self.store.hospitals[indexPath.row]];
  [cell bindDataWith:self.store.hospitalViewModels[indexPath.row]];
  cell.contentView.backgroundColor = [UIColor greenColor];
}

- (void)loadNewData
{
  [self.store loadNewDataWithCallBack:^(NSString *errorMessage) {
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
  }];
}

- (void)loadMoreData
{
  [self.store loadMoreDataWithCallBack:^(NSString *errorMessage, BOOL hasNextPage) {
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
    if (!hasNextPage) {
      [self dontNeedLoadMore];
    }    
  }];
}


- (void)rightButtonClicked:(UIButton *)button
{
  NSLog(@"添加按钮被点击了");
}

- (void)emptyViewReladButtonDidTap
{
  [self loadNewData];
}


@end
