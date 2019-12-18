//
//  NavigationButton.h
//  VSSMobile
//
//  Created by 路  on 17/6/9.
//  Copyright © 2017年 Fun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationButton : NSObject

+(UIBarButtonItem *)getBarButtonItem:(NSString *)imgName withTarget:(id)target withAction:(SEL)action;
+(UIBarButtonItem *)getRightBarButtonItem:(NSString *)imgName withTarget:(id)target withAction:(SEL)action;

@end
