//
//  DatePickerVIew.m
//  Tom Account
//
//  Created by ycx on 2019/11/3.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "DatePickerVIew.h"
#import "XMHeader.h"
#import "Masonry.h"
@interface DatePickerVIew ()
{
  
}
@end
@implementation DatePickerVIew

-(void) initDatePickerViewWith:(NSDate *)date With:(UIDatePickerMode)pickerMode
{
//    self.backgroundColor = UIColorFromRGB(0xFFFFFF);
//    self.layer.cornerRadius = 15.0;
//    [self.layer setMasksToBounds:YES];
    //设置背景颜色为黑色，并有0.4的透明度
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    self.frame = [UIScreen mainScreen].bounds;
    self.contentView = [[UIView alloc] init];
    self.contentView.layer.cornerRadius = 15.0;
    self.contentView.backgroundColor = UIColorFromRGB(0xFFFFFF);;
    [self.contentView.layer setMasksToBounds:YES];
    [self addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_offset(345);
        make.height.mas_offset(260);
        make.bottom.equalTo(self.mas_bottom).offset(-20);
    }];
    self.bgview = [[UIView alloc] init];
    self.bgview.backgroundColor = UIColorFromRGB(0xEEEEEE);
    [self.contentView addSubview:self.bgview];
    [self.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_offset(30);
    }];
//    [self dismiss];
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.imgView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
//       CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//       maskLayer.frame = self.imgView.bounds;
//       maskLayer.path = maskPath.CGPath;
//       self.imgView.layer.mask = maskLayer;
    
    self.cancelBtn = [[UIButton alloc] init];
    [self.cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    self.cancelBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.cancelBtn addTarget:self action:@selector(btnCancelClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bgview addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgview.mas_left);
        make.top.equalTo(self.bgview.mas_top);
        make.bottom.equalTo(self.bgview.mas_bottom);
        make.width.mas_offset(100);
    }];
    
    self.doneBtn = [[UIButton alloc] init];
    [self.doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    [self.doneBtn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    self.doneBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.doneBtn addTarget:self action:@selector(btnDoneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bgview addSubview:self.doneBtn];
    [self.doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgview.mas_right);
        make.top.equalTo(self.bgview.mas_top);
        make.bottom.equalTo(self.bgview.mas_bottom);
        make.width.mas_offset(100);
    }];
    
    self.title = [[UILabel alloc]init];
    self.title.textColor = UIColorFromRGB(0x000000);
    self.title.font = [UIFont fontWithName:@"Futura-Medium" size:20.0];
    self.title.text = @"Date";
    self.title.textAlignment = NSTextAlignmentCenter;
    [self.bgview addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_offset(self.bgview.center);
        make.top.equalTo(self.bgview.mas_top);
        make.bottom.equalTo(self.bgview.mas_bottom);
        make.width.mas_offset(100);
    }];
    
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = pickerMode;
    self.datePicker.backgroundColor = [UIColor clearColor];
    [self.datePicker setValue:UIColorFromRGB(0x000000) forKey:@"textColor"];
    self.datePicker.date = date;
    //监听DataPicker的滚动
    [self.datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.datePicker];
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgview.mas_bottom);
        make.left.equalTo(self.contentView.mas_left);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
}


- (void)btnCancelClick
{
    [self dismiss];
}

- (void)btnDoneClick
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置时间格式
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *dateStr = [formatter  stringFromDate:self.datePicker.date];
    if (self.dateStrBlock) {
        self.dateStrBlock(dateStr);
    }
    [self dismiss];
}

-(void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

-(void)dismiss
{
//    [UIView animateWithDuration:0.4 animations:^{
//        self->self.contentView.center = CGPointMake(self.frame.size.width/2, self->self.contentView.center.y + self.contentView.frame.size.height);
//    } completion:^(BOOL finished) {
        [self removeFromSuperview];
//    }];
}
- (void)dateChange:(UIDatePicker *)datePicker {
    

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view == self) {
        [self dismiss];
    }
}
@end
