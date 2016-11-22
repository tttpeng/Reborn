//
//  HWBaseTableViewController.h
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWBaseViewController.h"

@interface HWBaseTableViewController : HWBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) CGFloat          cellHeight;
@property (nonatomic, assign) NSString         *cellIdentifier;
@property (nonatomic, strong) UITableView      *tableView;
@property (nonatomic, assign) UITableViewStyle tableStyle;


- (void)emptyViewReladButtonDidTap;


- (void)configDataForCell:(id)cell atIndexPath:(NSIndexPath *)indexPath;


@end
