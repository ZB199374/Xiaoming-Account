//
//  XMDetailsView.m
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/6.
//  Copyright © 2019 XM. All rights reserved.
//

#import "XMDetailsView.h"
#import "DatePickerVIew.h"
#import "XMHeader.h"
@interface XMDetailsView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation XMDetailsView
static NSString *cellIdentifier = @"MyTableCell";
- (IBAction)valueChanged:(id)sender {
}

- (IBAction)btnDateClick:(id)sender {
}

#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
}
@end
