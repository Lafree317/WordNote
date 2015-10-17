//
//  MD5Hash.h
//  wejoy
//
//  Created by liumingkong on 14-2-17.
//  Copyright (c) 2014年 wejoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5Hash : NSObject

+ (NSString*) md5Hash16:(NSString*) input;
+ (NSString*) md5Hash32:(NSString*) input;
@end
