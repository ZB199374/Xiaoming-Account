//
//  HomeView.m
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/6.
//  Copyright © 2019 XM. All rights reserved.
//

#import "XMHomeView.h"
#import "AccountSqlite.h"
#import "XMHomeTableViewCell.h"
@interface XMHomeView ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArr;
}
@end
@implementation XMHomeView
static NSString *cellIdentifier = @"MyTableCell";
- (void)initHomeView
{
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"XMHomeTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    [self reloadData];
}

- (void)reloadData
{
    dataArr = [NSMutableArray array];
    NSMutableArray *incomeArr = [IncomeSqlite getAllIncomes];
    NSMutableArray *expenditureArr = [ExpenditureSqlite getAllExpenditures];
    [dataArr addObjectsFromArray:(NSArray *)incomeArr];
    [dataArr addObjectsFromArray:(NSArray *)expenditureArr];
    [dataArr sortUsingComparator:^NSComparisonResult(Account *account1, Account *account2) {
        return [account2.date compare:account1.date];
    }];
    [self.tableView reloadData];
}

#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.account = [dataArr objectAtIndex:indexPath.row];
    cell.dateLab.text = [self getMonthFormDate:cell.account.date];
    cell.categoryIV.image = [UIImage imageNamed:cell.account.category];
    cell.useLab.text = cell.account.use;
    cell.amountLab.text = cell.account.amount;
    cell.layer.cornerRadius = 10.0;

    return cell;
}

- (NSString *)getMonthFormDate:(NSString *)date
{
    NSString *month = [date substringWithRange:NSMakeRange(5, 2)];
    NSString *day = [date substringWithRange:NSMakeRange(8, 2)];
    
    return [NSString stringWithFormat:@"%@ %@",[self monthEn:[month integerValue]],day];
}

- (NSString *)monthEn:(NSInteger)month{
   NSCalendar *caldendar = [NSCalendar currentCalendar];// 获取日历
   NSArray *monthArr = [NSArray arrayWithArray:caldendar.shortMonthSymbols];  // 获取日历月数组
   return monthArr[month - 1];  // 获得数字月份下的对应英文月缩写
}
@end
