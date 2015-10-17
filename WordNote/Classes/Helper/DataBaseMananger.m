//
//  DataBaseMananger.m
//  WordNote
//
//  Created by 杨威 on 15/9/22.
//  Copyright (c) 2015年 Yoni. All rights reserved.
//

#import "DataBaseMananger.h"
static NSString * kShopCar_table = @"Lanou_table";
static NSString * DATABASE_NAME = @"Lanou.db";
@interface DataBaseMananger ()

@end

@implementation DataBaseMananger

+(instancetype )shareManeger
{
    static  DataBaseMananger * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc]init];
    });
    return manager;
}



#pragma mark - 数据存储 ----
-(void)saveDataWithKey:(NSString *)key params:(NSDictionary *)params
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:DATABASE_NAME];
    NSString *tableName = kShopCar_table;
    [store createTableWithName:tableName];
    // 保存
    NSString * kqey = key;
    [store putObject:params withId:kqey intoTable:tableName];
}

#pragma mark 数据读取
-(NSArray *)getDataFromDB
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:DATABASE_NAME];
    NSString *tableName = kShopCar_table;
    [store createTableWithName:tableName];
    NSArray * array = [store getAllItemsFromTable:tableName];
    return array;
}


-(YTKKeyValueItem *)getItemsByID:(NSString *)objectID
{
    YTKKeyValueStore  * store = [[YTKKeyValueStore alloc]initDBWithName:DATABASE_NAME];
    YTKKeyValueItem * items =  [store getYTKKeyValueItemById:objectID fromTable:kShopCar_table];
    return items;
}

#pragma mark - 删除数据
-(void)deleteDataWithID:(NSString *)Id
{
    NSLog(@"%@",Id);
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:DATABASE_NAME];
    NSString *tableName = kShopCar_table;
    [store createTableWithName:tableName];
    [store deleteObjectById:Id fromTable:tableName];
}


#pragma mark - 字典 转换成  jsondata
- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}




@end
