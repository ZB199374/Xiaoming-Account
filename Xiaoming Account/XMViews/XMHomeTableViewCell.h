//
//  HomeTableViewCell.h
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/6.
//  Copyright © 2019 XM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountSqlite.h"
NS_ASSUME_NONNULL_BEGIN

@interface XMHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dateLab;
@property (weak, nonatomic) IBOutlet UILabel *useLab;
@property (weak, nonatomic) IBOutlet UIImageView *categoryIV;
@property (weak, nonatomic) IBOutlet UILabel *amountLab;
@property (strong,nonatomic) Account *account;
@end

NS_ASSUME_NONNULL_END
