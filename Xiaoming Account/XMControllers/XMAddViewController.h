//
//  XMAddViewController.h
//  Xiaoming Account
//
//  Created by 张兵 on 2019/12/3.
//  Copyright © 2019 XM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMAddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *incomeBtn;
@property (weak, nonatomic) IBOutlet UIButton *expenditureBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineCenter;
@property (weak, nonatomic) IBOutlet UITextField *amountField;
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@property (weak, nonatomic) IBOutlet UITextField *useField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UILabel *categoryLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;

@end

NS_ASSUME_NONNULL_END
