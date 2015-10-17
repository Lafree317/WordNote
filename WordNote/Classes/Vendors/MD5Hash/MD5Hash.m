//
//  MD5Hash.m
//  wejoy
//
//  Created by liumingkong on 14-2-17.
//  Copyright (c) 2014年 wejoy. All rights reserved.
//

#import "MD5Hash.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MD5Hash


// 16位MD5Hash
+ (NSString*) md5Hash16:(NSString*) input {
    const char* str = [input UTF8String];
    unsigned char result[16];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

// 32位MD5Hash
+ (NSString*) md5Hash32:(NSString*) input {
    const char* str = [input UTF8String];
    unsigned char result[32];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

@end
