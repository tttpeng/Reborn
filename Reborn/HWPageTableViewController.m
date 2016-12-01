//
//  HWPageTableViewController.m
//  Reborn
//
//  Created by tpeng on 2016/12/1.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWPageTableViewController.h"
#import "HWPageStore.h"

@interface HWPageTableViewController ()

@property (nonatomic, strong) HWPageStore *store;

@end

@implementation HWPageTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadNewData];
}


- (void)refreshData
{
  [self.tableView reloadData];

}

- (void)loadNewData
{
  [super loadNewData];
  [self.store loadNewDataWithCallBack:^(HWStoreDataState state, NSString *errorMessage) {
    [self.tableView.mj_header endRefreshing];
    if (state == HWStoreDataStateNormal) {
      [self refreshData];
    }
  }];
}

- (void)loadMoreData
{
  [super loadMoreData];
  [self.store loadMoreDataWithCallBack:^(HWStoreDataState state, NSString *errorMessage) {
    [self.tableView.mj_footer endRefreshing];
    if (state == HWStoreDataStateNormal) {
      [self refreshData];
    }
    if (state == HWStoreDataStateNoNextPage) {
      [self dontNeedLoadMore];
    }
  }];
}

- (void)emptyViewReladButtonDidTap
{
  [self loadNewData];
}



@end
