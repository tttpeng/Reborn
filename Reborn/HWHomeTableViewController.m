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
#import <SDWebImage/UIImageView+WebCache.h>

@interface HWHomeTableViewController ()

@property (nonatomic, strong) HWHomeStore *store;
@property (nonatomic, strong) HWHospitalViewModel *viewModel;

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
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.store.hospitals.count;
}

- (void)configDataForCell:(HWHospitalCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
  cell.contentView.backgroundColor = [UIColor greenColor];
  cell.nameLabel.text = [self.viewModel hospitalNameAtIndex:indexPath.row];
  cell.addressLabel.text = [self.viewModel hospitalAddressAtIndex:indexPath.row];
  [cell.pictureView sd_setImageWithURL:[self.viewModel hospitalPictureURLAtIndex:indexPath.row]];
}

- (void)rightButtonClicked:(UIButton *)button
{
  NSLog(@"添加按钮被点击了");
}


- (HWHospitalViewModel *)viewModel
{
  if (_viewModel == nil) {
    _viewModel = [[HWHospitalViewModel alloc] init];
    _viewModel.store = self.store;
  }
  return _viewModel;
}

- (HWHomeStore *)store
{
  if (_store == nil) {
    _store = [[HWHomeStore alloc] init];
  }
  return _store;
}

@end
