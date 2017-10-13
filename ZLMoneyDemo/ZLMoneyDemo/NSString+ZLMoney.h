//
//  NSString+ZLMoney.h
//  ZLMoneyDemo
//
//  Created by ZL on 2017/8/17.
//  Copyright © 2017年 zhangli. All rights reserved.
//  金额的格式转化

#import <Foundation/Foundation.h>

@interface NSString (ZLMoney)

// 自定义正数格式(金额的格式转化) 94,862.57
+ (NSString *)stringChangeMoneyWithDouble:(double)number;


// 金额的格式转化 ￥94,862.57这样的形式
+ (NSString *)stringChangeMoneyWithStr:(NSString *)str;

/**
 * 金额的格式转化
 * str : 金额的字符串
 * numberStyle : 金额转换的格式
 * return  NSString : 转化后的金额格式字符串
 */
+ (NSString *)stringChangeMoneyWithStr:(NSString *)str numberStyle:(NSNumberFormatterStyle)numberStyle;

@end
