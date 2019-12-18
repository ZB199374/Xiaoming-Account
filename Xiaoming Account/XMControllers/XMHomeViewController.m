//
//  XMHomeViewController.m
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/3.
//  Copyright © 2019 XM. All rights reserved.
//

#import "XMHomeViewController.h"
#import "XMHomeView.h"
#import "XMAddViewController.h"
#import "Masonry.h"
#import "XMHeader.h"
#import "XMDetailsView.h"
#import "AccountSqlite.h"
#import "NavigationButton.h"
#import "RESideMenu.h"
@interface XMHomeViewController ()
{
    XMHomeView *homeView;
    XMDetailsView *detailsView;
}
@end

@implementation XMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftBarBtn = [NavigationButton getRightBarButtonItem:@"汉堡菜单" withTarget:self withAction:@selector(btnMenuAction)];;
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"XMViews" owner:self options:nil];
    // Do any additional setup after loading the view from its nib.
    homeView = [[XMHomeView alloc] init];
    homeView = [nib objectAtIndex:0];
    [homeView initHomeView];
    homeView.hidden = YES;
    [self.view addSubview:homeView];
    [homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(BarHeight);
        make.bottom.equalTo(self.toolView.mas_top);
    }];
    detailsView = [[XMDetailsView alloc] init];
    detailsView.hidden = YES;
    [self.view addSubview:detailsView];
    [detailsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(BarHeight);
        make.bottom.equalTo(self.toolView.mas_top);
    }];
    [self homeBtnClick:nil];
    
    [self.view bringSubviewToFront:self.toolView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [homeView reloadData];
    NSMutableArray * dataArr = [NSMutableArray array];
    NSMutableArray *incomeArr = [IncomeSqlite getAllIncomes];
    NSMutableArray *expenditureArr = [ExpenditureSqlite getAllExpenditures];
    [dataArr addObjectsFromArray:(NSArray *)incomeArr];
    [dataArr addObjectsFromArray:(NSArray *)expenditureArr];
    if (dataArr.count > 0) {
        self.emptyIV.hidden = YES;
    } else {
        self.emptyIV.hidden = NO;
    }
}

- (IBAction)homeBtnClick:(id)sender {
    self.title = @"HOME";
    self.homeLabel.textColor = UIColorFromRGB(0xBF5AF2);
    self.DetailsLab.textColor = UIColorFromRGB(0xD1CECE);
    self.homeImageView.image = [UIImage imageNamed:@"首页点击"];
    self.detailsIV.image = [UIImage imageNamed:@"详情-未点击"];
    homeView.hidden = NO;
    detailsView.hidden = YES;
}
- (IBAction)detailsBtnClick:(id)sender {
    self.title = @"DETAILS";
    self.homeLabel.textColor = UIColorFromRGB(0xD1CECE);
    self.DetailsLab.textColor = UIColorFromRGB(0xBF5AF2);
    self.homeImageView.image = [UIImage imageNamed:@"首页-未点击"];
    self.detailsIV.image = [UIImage imageNamed:@"详情-点击"];
    homeView.hidden = YES;
    detailsView.hidden = NO;
}
- (IBAction)addBtnClick:(id)sender {
    [self.navigationController pushViewController:[XMAddViewController new] animated:YES];
}

- (void)btnMenuAction
{
    [self.sideMenuViewController presentLeftMenuViewController];
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
