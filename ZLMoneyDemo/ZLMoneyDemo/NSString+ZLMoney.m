//
//  NSString+ZLMoney.m
//  ZLMoneyDemo
//
//  Created by ZL on 2017/8/17.
//  Copyright © 2017年 zhangli. All rights reserved.
//

#import "NSString+ZLMoney.h"

@implementation NSString (ZLMoney)

// 自定义正数格式(金额的格式转化) 94,862.57 前缀可在所需地方随意添加
+ (NSString *)stringChangeMoneyWithDouble:(double)number {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.positiveFormat = @",###.##"; // 正数格式
    // 注意传入参数的数据长度，可用double
    NSString *money = [formatter stringFromNumber:@(number)];
    
    return money;
}

//-------------------------------------------------

// 金额的格式转化 默认格式
+ (NSString *)stringChangeMoneyWithStr:(NSString *)str {
    
    // 判断是否null 若是赋值为0 防止崩溃
    if (([str isEqual:[NSNull null]] || str == nil)) {
        str = 0;
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle; // 94,862.57这样的形式
    
    // 注意传入参数的数据长度，可用double
    NSString *money = [formatter stringFromNumber:[NSNumber numberWithDouble:[str doubleValue]]];
    // iOS11之后kCFNumberFormatterCurrencyStyle 前缀变成了CN￥不是￥.这里选择使用kCFNumberFormatterDecimalStyle然后拼接￥符号
    money = [NSString stringWithFormat:@"￥%@", money];
    
    return money;
}

/**
 * 金额的格式转化
 * str : 金额的字符串
 * numberStyle : 金额转换的格式
 * return  NSString : 转化后的金额格式字符串
 */
+ (NSString *)stringChangeMoneyWithStr:(NSString *)str numberStyle:(NSNumberFormatterStyle)numberStyle {
    
    // 判断是否null 若是赋值为0 防止崩溃
    if (([str isEqual:[NSNull null]] || str == nil)) {
        str = 0;
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = numberStyle;
    
    NSString *money = [formatter stringFromNumber:[NSNumber numberWithDouble:[str doubleValue]]];
    
    return money;
}

/**
 * NSNumberFormatter类有个属性numberStyle，是一个枚举型，设置不同的值可以输出不同的数字格式。该枚举包括：
 * 94863
 * NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,
 
 * 94,862.57
 * NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle,
 
 * ￥94,862.57
 * NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle,
 
 * 9,486,257%
 * NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,
 
 * 9.486257E4
 * NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle,
 
 * 九万四千八百六十二点五七
 * NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle
 */

@end
