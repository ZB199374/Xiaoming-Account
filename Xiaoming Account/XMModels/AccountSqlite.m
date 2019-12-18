//
//  ExpenditureSqlite.m
//  Tom Account
//
//  Created by ycx on 2019/11/1.
//  Copyright © 2019 ZB. All rights reserved.
//

#import "AccountSqlite.h"
#import "XMHeader.h"
#import <sqlite3.h>

@implementation Account



@end

@implementation ExpenditureSqlite

+(BOOL)insertExpenditureTableWith:(Account *)expenditure
{
    BOOL result = FALSE;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if(find)
    {

        // 2.打开iPhone上的sqlite3的数据库文件
        sqlite3 *database;
        // 判断数据库是否打开
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)
        {
            sqlite3_close(database);
            NSLog(@"打开数据库文件失败");
        }
        else
        {
            //插入
            NSMutableString *sqlStr = [NSMutableString string];
            [sqlStr appendFormat:@"insert into %@ (amount, category, date, use) values ('%@', '%@', '%@', '%@')", ExpenditureTable,expenditure.amount,expenditure.category,expenditure.date,expenditure.use];
            char *errmsg;
            if (sqlite3_exec(database, [sqlStr UTF8String], NULL, NULL, &errmsg) != SQLITE_OK) {
                NSLog(@"插入数据失败:%s", errmsg);
                result = FALSE;
            } else {
                result = true;
            }
            sqlite3_close(database);
        }
    }
    return result;
}

+(NSMutableArray *)getAllExpenditures
{
    // 返回值
    NSMutableArray *list = [NSMutableArray array];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if(find)
    {
        // 2.打开iPhone上的sqlite3的数据库文件
        sqlite3 *database;
        // 判断数据库是否打开
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)
        {
            sqlite3_close(database);
            NSLog(@"打开数据库文件失败");
        }
        else
        {
            // 3.准备sql语句
            sqlite3_stmt *statement;

            NSMutableString *sqlStr = [NSMutableString string];
            [sqlStr appendFormat:@"select id, amount, category, date, use from %@", ExpenditureTable];

            if(sqlite3_prepare_v2(database, [sqlStr UTF8String], -1, &statement, nil) == SQLITE_OK)
            {
                while(sqlite3_step(statement) == SQLITE_ROW)
                {
                    Account *item = [[Account alloc]init];
                    
                    item.accountID = (int) sqlite3_column_int(statement, 0);

                    char *amount = (char *) sqlite3_column_text(statement, 1);
                    if(amount != NULL)
                        item.amount = [NSString stringWithUTF8String:amount];
                    else
                        item.amount = @"";

                    char *category = (char *) sqlite3_column_text(statement, 2);
                    if(category != NULL)
                        item.category = [NSString stringWithUTF8String:category];
                    else
                        item.category = @"";

                    char *date = (char *) sqlite3_column_text(statement, 3);
                    if(date != NULL)
                        item.date = [NSString stringWithUTF8String:date];
                    else
                        item.date = @"";

                    char *use = (char *) sqlite3_column_text(statement, 4);
                    if(use != NULL)
                        item.use = [NSString stringWithUTF8String:use];
                    else
                        item.use = @"";
                    
                    [list addObject:item];
                }
            }
            // 7.释放sql文资源
            sqlite3_finalize(statement);
            
            // 8.关闭iPhone上的sqlite3的数据库
            sqlite3_close(database);
        }
    }
    return list;
}

+(NSMutableArray *)getExpendituresWith:(NSString *)dateStr
{
    // 返回值
    NSMutableArray *list = [NSMutableArray array];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if(find)
    {
        // 2.打开iPhone上的sqlite3的数据库文件
        sqlite3 *database;
        // 判断数据库是否打开
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)
        {
            sqlite3_close(database);
            NSLog(@"打开数据库文件失败");
        }
        else
        {
            // 3.准备sql语句
            sqlite3_stmt *statement;

            NSMutableString *sqlStr = [NSMutableString string];
            [sqlStr appendFormat:@"select id, amount, category, date, use from %@ WHERE date like '%@%%'", ExpenditureTable,dateStr];

            if(sqlite3_prepare_v2(database, [sqlStr UTF8String], -1, &statement, nil) == SQLITE_OK)
            {
                while(sqlite3_step(statement) == SQLITE_ROW)
                {
                    Account *item = [[Account alloc]init];
                    
                    item.accountID = (int) sqlite3_column_int(statement, 0);

                    char *amount = (char *) sqlite3_column_text(statement, 1);
                    if(amount != NULL)
                        item.amount = [NSString stringWithUTF8String:amount];
                    else
                        item.amount = @"";

                    char *category = (char *) sqlite3_column_text(statement, 2);
                    if(category != NULL)
                        item.category = [NSString stringWithUTF8String:category];
                    else
                        item.category = @"";

                    char *date = (char *) sqlite3_column_text(statement, 3);
                    if(date != NULL)
                        item.date = [NSString stringWithUTF8String:date];
                    else
                        item.date = @"";

                    char *use = (char *) sqlite3_column_text(statement, 4);
                    if(use != NULL)
                        item.use = [NSString stringWithUTF8String:use];
                    else
                        item.use = @"";
                    
                    [list addObject:item];
                }
            }
            // 7.释放sql文资源
            sqlite3_finalize(statement);
            
            // 8.关闭iPhone上的sqlite3的数据库
            sqlite3_close(database);
        }
    }
    return list;
}

+(BOOL)deleteItem:(int)djLsh
{
    BOOL result = FALSE;
    // 1.获取iPhone上sqlite3的数据库文件的地址(应用程序沙盒里面的Documents文件夹)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if (find)
    {
        // 2.打开iPhone上的sqlite3的数据库文件
        sqlite3 *database;
        // 判断数据库是否打开
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)
        {
            sqlite3_close(database);
            NSLog(@"打开数据库文件失败");
        }
        else
        {
            // 3.准备sql语句
            NSString *sqlStr = [NSString stringWithFormat:@"delete from %@ where id = %i", ExpenditureTable, djLsh];
            
            // 4.执行sql语句
            char *erroMsg;
            if (sqlite3_exec(database, [sqlStr UTF8String], NULL, NULL, &erroMsg) != SQLITE_OK)
            {
                result = FALSE;
                NSLog(@"Error delete from table: %s", erroMsg);
            }
            else
            {
                result = TRUE;
            }
            
            // 5.关闭iPhone上的sqlite3的数据库
            sqlite3_close(database);
        }
    }
    return result;
}
@end

@implementation IncomeSqlite

+(BOOL)insertIncomeTableWith:(Account *)income
{
    BOOL result = FALSE;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if(find)
    {

        // 2.打开iPhone上的sqlite3的数据库文件
        sqlite3 *database;
        // 判断数据库是否打开
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)
        {
            sqlite3_close(database);
            NSLog(@"打开数据库文件失败");
        }
        else
        {
            //插入
            NSMutableString *sqlStr = [NSMutableString string];
            [sqlStr appendFormat:@"insert into %@ (amount, category, date, use) values ('%@', '%@', '%@', '%@')", IncomeTable,income.amount,income.category,income.date,income.use];
            char *errmsg;
            if (sqlite3_exec(database, [sqlStr UTF8String], NULL, NULL, &errmsg) != SQLITE_OK) {
                NSLog(@"插入数据失败:%s", errmsg);
                result = FALSE;
            } else {
                result = true;
            }
            sqlite3_close(database);
        }
    }
    return result;
}

+(NSMutableArray *)getAllIncomes
{
    // 返回值
    NSMutableArray *list = [NSMutableArray array];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if(find)
    {
        // 2.打开iPhone上的sqlite3的数据库文件
        sqlite3 *database;
        // 判断数据库是否打开
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)
        {
            sqlite3_close(database);
            NSLog(@"打开数据库文件失败");
        }
        else
        {
            // 3.准备sql语句
            sqlite3_stmt *statement;

            NSMutableString *sqlStr = [NSMutableString string];
            [sqlStr appendFormat:@"select id, amount, category, date, use from %@", IncomeTable];

            if(sqlite3_prepare_v2(database, [sqlStr UTF8String], -1, &statement, nil) == SQLITE_OK)
            {
                while(sqlite3_step(statement) == SQLITE_ROW)
                {
                    Account *item = [[Account alloc]init];
                    item.accountID = (int) sqlite3_column_text(statement, 0);

                    char *amount = (char *) sqlite3_column_text(statement, 1);
                    if(amount != NULL)
                        item.amount = [NSString stringWithUTF8String:amount];
                    else
                        item.amount = @"";

                    char *category = (char *) sqlite3_column_text(statement, 2);
                    if(category != NULL)
                        item.category = [NSString stringWithUTF8String:category];
                    else
                        item.category = @"";

                    char *date = (char *) sqlite3_column_text(statement, 3);
                    if(date != NULL)
                        item.date = [NSString stringWithUTF8String:date];
                    else
                        item.date = @"";

                    char *use = (char *) sqlite3_column_text(statement, 4);
                    if(use != NULL)
                        item.use = [NSString stringWithUTF8String:use];
                    else
                        item.use = @"";


                    [list addObject:item];
                }
            }
            // 7.释放sql文资源
            sqlite3_finalize(statement);
            
            // 8.关闭iPhone上的sqlite3的数据库
            sqlite3_close(database);
        }
    }
    return list;
}

+(NSMutableArray *)getIncomesWith:(NSString *)dateStr
{
    // 返回值
    NSMutableArray *list = [NSMutableArray array];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if(find)
    {
        // 2.打开iPhone上的sqlite3的数据库文件
        sqlite3 *database;
        // 判断数据库是否打开
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)
        {
            sqlite3_close(database);
            NSLog(@"打开数据库文件失败");
        }
        else
        {
            // 3.准备sql语句
            sqlite3_stmt *statement;

            NSMutableString *sqlStr = [NSMutableString string];
            [sqlStr appendFormat:@"select id, amount, category, date, use from %@ WHERE date like '%@%%'", IncomeTable,dateStr];

            if(sqlite3_prepare_v2(database, [sqlStr UTF8String], -1, &statement, nil) == SQLITE_OK)
            {
                while(sqlite3_step(statement) == SQLITE_ROW)
                {
                    Account *item = [[Account alloc]init];
                    
                    item.accountID = (int) sqlite3_column_int(statement, 0);

                    char *amount = (char *) sqlite3_column_text(statement, 1);
                    if(amount != NULL)
                        item.amount = [NSString stringWithUTF8String:amount];
                    else
                        item.amount = @"";

                    char *category = (char *) sqlite3_column_text(statement, 2);
                    if(category != NULL)
                        item.category = [NSString stringWithUTF8String:category];
                    else
                        item.category = @"";

                    char *date = (char *) sqlite3_column_text(statement, 3);
                    if(date != NULL)
                        item.date = [NSString stringWithUTF8String:date];
                    else
                        item.date = @"";

                    char *use = (char *) sqlite3_column_text(statement, 4);
                    if(use != NULL)
                        item.use = [NSString stringWithUTF8String:use];
                    else
                        item.use = @"";
                    
                    [list addObject:item];
                }
            }
            // 7.释放sql文资源
            sqlite3_finalize(statement);
            
            // 8.关闭iPhone上的sqlite3的数据库
            sqlite3_close(database);
        }
    }
    return list;
}

+(BOOL)deleteItem:(int)djLsh
{
    BOOL result = FALSE;
    // 1.获取iPhone上sqlite3的数据库文件的地址(应用程序沙盒里面的Documents文件夹)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL find = [fileManager fileExistsAtPath:path];
    if (find)
    {
        // 2.打开iPhone上的sqlite3的数据库文件
        sqlite3 *database;
        // 判断数据库是否打开
        if(sqlite3_open([path UTF8String], &database) != SQLITE_OK)
        {
            sqlite3_close(database);
            NSLog(@"打开数据库文件失败");
        }
        else
        {
            // 3.准备sql语句
            NSString *sqlStr = [NSString stringWithFormat:@"delete from %@ where id = %i", IncomeTable, djLsh];
            
            // 4.执行sql语句
            char *erroMsg;
            if (sqlite3_exec(database, [sqlStr UTF8String], NULL, NULL, &erroMsg) != SQLITE_OK)
            {
                result = FALSE;
                NSLog(@"Error delete from table: %s", erroMsg);
            }
            else
            {
                result = TRUE;
            }
            
            // 5.关闭iPhone上的sqlite3的数据库
            sqlite3_close(database);
        }
    }
    return result;
}
@end
