//
//  XMHomeViewController.h
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/3.
//  Copyright © 2019 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMHomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *toolView;
@property (weak, nonatomic) IBOutlet UIImageView *homeImageView;
@property (weak, nonatomic) IBOutlet UILabel *homeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *detailsIV;
@property (weak, nonatomic) IBOutlet UILabel *DetailsLab;
@property (weak, nonatomic) IBOutlet UIImageView *emptyIV;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

NS_ASSUME_NONNULL_END
