//
//  XMDetailsTableViewCell.h
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/7.
//  Copyright © 2019 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *categoryIV;
@property (weak, nonatomic) IBOutlet UILabel *useLab;
@property (weak, nonatomic) IBOutlet UILabel *amountLab;

@end

NS_ASSUME_NONNULL_END
