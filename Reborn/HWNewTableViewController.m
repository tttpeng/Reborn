//
//  HWNewTableViewController.m
//  Reborn
//
//  Created by tpeng on 2016/11/15.
//  Copyright © 2016年 healthcare-works. All rights reserved.
//

#import "HWNewTableViewController.h"

@interface HWNewTableViewController ()

@end

@implementation HWNewTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"列表";
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
  cell.backgroundColor = [UIColor randomColor];
  cell.textLabel.text = @"sad";
  return cell;
}





@end
