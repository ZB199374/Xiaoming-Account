//
//  XMHeader.h
//  Xiaoming Notes
//
//  Created by ycx on 2019/10/26.
//  Copyright © 2019 ZB. All rights reserved.
//

#ifndef XMHeader_h
#define XMHeader_h

#define Width 667
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define BarHeight self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height
#define FontNameKey [NSString stringWithFormat:@"fontNameKey"]
#define SizeKey [NSString stringWithFormat:@"sizeKey"]
#define SortKey [NSString stringWithFormat:@"sortKey"]
#define DisplayKey [NSString stringWithFormat:@"displayKey"]

#define DB_NAME @"Account.sqlite"
#define DB_NAME_NOSUFFIX @"Account"
#define ExpenditureTable @"Expenditure"
#define IncomeTable @"Income"
#endif /* XMHeader_h */
