//
//  HomeView.h
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/6.
//  Copyright © 2019 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMHomeView : UIView
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (void)initHomeView;
- (void)reloadData;
@end

NS_ASSUME_NONNULL_END
