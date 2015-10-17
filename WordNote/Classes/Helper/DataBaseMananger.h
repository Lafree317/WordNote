//
//  DataBaseMananger.h
//  WordNote
//
//  Created by 杨威 on 15/9/22.
//  Copyright (c) 2015年 Yoni. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataBaseMananger : NSObject

// 单例声明
+(instancetype )shareManeger;

// 数据存储
-(void)saveDataWithKey:(NSString *)key params:(NSDictionary *)params;

// 数据读取 读取所有数据
-(NSArray *)getDataFromDB;

// 根据ID读取数据
-(YTKKeyValueItem *)getItemsByID:(NSString *)objectID;

// 删除数据
-(void)deleteDataWithID:(NSString *)Id;

// 字典转化成JSON
- (NSString*)dictionaryToJson:(NSDictionary *)dic;




@end
