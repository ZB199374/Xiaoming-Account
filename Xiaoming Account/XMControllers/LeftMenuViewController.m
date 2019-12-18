//
//  LeftMenuViewController.m
//  安峰小说
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "Masonry.h"
#import "UIView+Toast.h"
#import "XMHeader.h"
#import "SVProgressHUD.h"
//#import "SuggestionsViewController.h"
//#import "VersionViewController.h"
#import "NavigationViewController.h"
@interface LeftMenuViewController ()
@property (strong, readwrite, nonatomic) UITableView *tableView;
@property(nonatomic)BOOL myChoose;
@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"SFCompactDisplay-Medium" size:18];
    label.textColor = UIColorFromRGB(0xFFFFFF);
    label.text = @"Setting";
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(25);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(20);
        make.height.mas_offset(25);
    }];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] init];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(40);
        make.left.equalTo(self.view.mas_left);
        make.width.mas_offset(ScreenWidth*2/3);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}



#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"SFCompactDisplay-Medium" size:14];
        cell.textLabel.textColor = UIColorFromRGB(0xFFFFFF);
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    NSArray *titles = @[@"Clear cache", @"Feedback",@"About us"];
    NSArray *images = @[@"清理", @"意见反馈",@"关于"];
    cell.textLabel.text = titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    return cell;
}
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.sideMenuViewController hideMenuViewController];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            [SVProgressHUD showWithStatus:@"Clearing"];
            [SVProgressHUD dismissWithDelay:1.0 completion:^{
            }];
            break;
        }
        case 1:
        {
//            SuggestionsViewController *feedBackVC = [[SuggestionsViewController alloc] init];
//            [self.mainVC.navigationController pushViewController:feedBackVC animated:NO];
            break;
        }
        case 2:
        {
//            [self.mainVC.navigationController pushViewController:[VersionViewController new] animated:NO];
            break;
        }

        
        default:
            break;
    }
}


@end
