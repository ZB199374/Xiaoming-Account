//
//  ExpenditureSqlite.h
//  Tom Account
//
//  Created by ycx on 2019/11/1.
//  Copyright © 2019 ZB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface Account : NSObject
@property (nonatomic,assign) int accountID;
@property (nonatomic,strong) NSString *amount;
@property (nonatomic,strong) NSString *category;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *use;
@end



@interface ExpenditureSqlite : NSObject

+(BOOL)insertExpenditureTableWith:(Account *)expenditure;
+(NSMutableArray *)getAllExpenditures;
+(NSMutableArray *)getExpendituresWith:(NSString *)dateStr;
// 删除
+(BOOL) deleteItem:(int)djLsh;
@end

@interface IncomeSqlite : NSObject

+(BOOL)insertIncomeTableWith:(Account *)expenditure;
+(NSMutableArray *)getAllIncomes;
+(NSMutableArray *)getIncomesWith:(NSString *)dateStr;
// 删除
+(BOOL) deleteItem:(int)djLsh;
@end
NS_ASSUME_NONNULL_END
