//
//  HWBaseTableViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWBaseTableViewController.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import "UITableView+FDTemplateLayoutCell.h"

@interface HWBaseTableViewController ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@end

@implementation HWBaseTableViewController

- (void)initController
{
  [super initController];
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
  _tableView.emptyDataSetSource = self;
  _tableView.emptyDataSetDelegate = self;
  _tableView.backgroundColor = [UIColor clearColor];
  
  if ([NSClassFromString(_cellIdentifier) isSubclassOfClass:[UITableViewCell class]]) {
    [_tableView registerClass:NSClassFromString(_cellIdentifier) forCellReuseIdentifier:_cellIdentifier];
  }
  
  [self.view addSubview:_tableView];
  
  [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.view.mas_left);
    make.right.equalTo(self.view.mas_right);
    make.top.mas_equalTo(64);
    make.bottom.mas_equalTo(0);
  }];
  
  [self setupRefreshCompnent];
}


- (void)setupRefreshCompnent
{
  self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
  MJRefreshAutoStateFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
  footer.triggerAutomaticallyRefreshPercent = -3;
  self.tableView.mj_footer = footer;

}

- (void)dontNeedLoadMore
{
  MJRefreshAutoStateFooter *footer = (MJRefreshAutoStateFooter *)self.tableView.mj_footer;
  [footer endRefreshingWithNoMoreData];
}

- (void)loadNewData
{
  MJRefreshAutoStateFooter *footer = (MJRefreshAutoStateFooter *)self.tableView.mj_footer;
  [footer resetNoMoreData];
}

- (void)loadMoreData
{
  
}

#pragma mark - 数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
  [self configDataForCell:cell atIndexPath:indexPath];
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (tableView.rowHeight > 0) {
    return tableView.rowHeight;
  }else{
    __weak __typeof(self)weakSelf = self;
    NSAssert(_cellIdentifier.length > 0, @"HWBaseTableViewController 中的tableView:heightForRowAtIndexPath 方法想使用 _cellIdentifier, 然而 _cellIdentifier 为空");
    CGFloat height = [tableView fd_heightForCellWithIdentifier:_cellIdentifier
                                              cacheByIndexPath:indexPath
                                                 configuration:^(UITableViewCell *cell) {
      [weakSelf configDataForCell:cell atIndexPath:indexPath];
    }];
    
    return height;
  }
}

- (void)configDataForCell:(id)cell atIndexPath:(NSIndexPath *)indexPath
{
  
}

#pragma mark - 空白占位图
- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView
{
  self.tableView.mj_footer.hidden = YES;
}

- (void)emptyDataSetWillDisappear:(UIScrollView *)scrollView
{
  self.tableView.mj_footer.hidden = NO;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
  return [UIImage imageNamed:@"cure_selected"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
  NSString *text = @"网络请求失败";
  
  NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                               NSForegroundColorAttributeName: [UIColor darkGrayColor]};
  
  return [[NSAttributedString alloc] initWithString:text attributes:attributes];

}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
  NSString *text = @"请检查您的网络，重新加载吧";
  
  NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
  paragraph.lineBreakMode = NSLineBreakByWordWrapping;
  paragraph.alignment = NSTextAlignmentCenter;
  
  NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                               NSForegroundColorAttributeName: [UIColor lightGrayColor],
                               NSParagraphStyleAttributeName: paragraph};
  
  return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
  NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0f]};
  
  return [[NSAttributedString alloc] initWithString:@"重新加载" attributes:attributes];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
  [self emptyViewReladButtonDidTap];
}

- (void)emptyViewReladButtonDidTap {}

@end
