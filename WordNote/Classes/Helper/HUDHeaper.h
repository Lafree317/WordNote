//
//  HUDHeaper.h
//  WordNote
//
//  Created by 杨威 on 15/9/23.
//  Copyright (c) 2015年 Yoni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUDHeaper : NSObject
//带转圈，加文字
+ (MBProgressHUD *)addHUDProgressInView:(UIView *)view text:(NSString *)text;

+ (MBProgressHUD *)addHUDProgressInView:(UIView *)view text:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;

//+ (MBProgressHUD *)addHUDInView:(UIView *)view;

//不带转圈，加文字
+ (MBProgressHUD *)addHUDInView:(UIView *)view text:(NSString *)text;

+ (MBProgressHUD *)addHUDInView:(UIView *)view text:(NSString *)text hideAfterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)addHUDInView:(UIView *)view text:(NSString *)text fontSize:(CGFloat)fontSize alpha:(CGFloat)alpha;

+ (void)hideHUDForView:(UIView *)view animated:(BOOL)animated;

+ (void)hideAllHUDsForView:(UIView *)view animated:(BOOL)animated;

+ (void)hideHUD:(MBProgressHUD *)progress afterDelay:(NSTimeInterval)delay animated:(BOOL)animated;

@end
