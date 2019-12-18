//
//  DatePickerVIew.h
//  Tom Account
//
//  Created by ycx on 2019/11/3.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface DatePickerVIew : UIView
@property (strong, nonatomic) UIView *bgview;
@property (strong, nonatomic) UIButton *cancelBtn;
@property (strong, nonatomic) UIButton *doneBtn;
@property (strong, nonatomic) UILabel *title;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIView *contentView;
 @property (nonatomic, strong) void(^dateStrBlock)(NSString *);

-(void) initDatePickerViewWith:(NSDate *)date With:(UIDatePickerMode)pickerMode;
-(void)show;
-(void)dismiss;
@end

NS_ASSUME_NONNULL_END
