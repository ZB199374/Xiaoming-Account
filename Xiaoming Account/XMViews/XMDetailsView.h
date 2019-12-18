//
//  XMDetailsView.h
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/6.
//  Copyright © 2019 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMDetailsView : UIView
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@property (weak, nonatomic) IBOutlet UILabel *accountLab;

@end

NS_ASSUME_NONNULL_END
