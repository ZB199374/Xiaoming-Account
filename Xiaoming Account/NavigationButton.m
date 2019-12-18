//
//  NavigationButton.m
//  VSSMobile
//
//  Created by 路  on 17/6/9.
//  Copyright © 2017年 Fun. All rights reserved.
//

#import "NavigationButton.h"

@implementation NavigationButton

+(UIBarButtonItem *)getBarButtonItem:(NSString *)imgName withTarget:(id)target withAction:(SEL)action
{
    UIImage *backImg = [UIImage imageNamed:imgName];
    UIBarButtonItem *backBarBtn = [[UIBarButtonItem alloc] initWithImage:backImg style:UIBarButtonItemStyleDone target:target action:action];
    return backBarBtn;
}
+(UIBarButtonItem *)getRightBarButtonItem:(NSString *)imgName withTarget:(id)target withAction:(SEL)action
{
    NSString* version = [[UIDevice currentDevice] systemVersion];
    UIImage *backImg = [UIImage imageNamed:imgName];
    UIButton *backBtn = nil;
    if ([version intValue] >= 11) {
        backBtn = [[UIButton alloc] initWithFrame:CGRectMake(-5, 0.f, 50, 30)];
    } else {
        backBtn = [[UIButton alloc] initWithFrame:CGRectMake(-5, 0.f, 50, 30)];
    }
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:backImg forState:UIControlStateNormal];
    UIView *backBtnView = [[UIView alloc] initWithFrame:backBtn.bounds];
    [backBtnView addSubview:backBtn];
    UIBarButtonItem *backBarBtn = [[UIBarButtonItem alloc] initWithCustomView:backBtnView];
    return backBarBtn;
    
}

@end
