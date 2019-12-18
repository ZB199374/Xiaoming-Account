//
//  LeftMenuViewController.h
//  安峰小说
//
//  Created by admin on 2019/4/9.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMHomeViewController.h"
#import "RESideMenu.h"
NS_ASSUME_NONNULL_BEGIN

@interface LeftMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong) XMHomeViewController *mainVC;
@end

NS_ASSUME_NONNULL_END
