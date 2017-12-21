# ZLMoneyDemo
iOS - 格式化金额,三位一逗号


项目版本更新迭代中, 新增需求: 所有金额必须用标准会计表示方式(**￥94,862.57**).
而之前金额展示仅仅天天人民币￥符号, 千位没有逗号, 仅仅拼接字符串就好 .

![](https://github.com/ZLFighting/ZLMoneyDemo/blob/master/ZLMoneyDemo/0.png)



由于项目中很多地方展现统计金额, 准备考虑封装下分类.
**自定义金额的格式转化文件NSString+ZLMoney:**

通过`NSNumberFormatter`，设置NSNumber输出的格式:
```
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
// 注意传入参数的数据长度，可用double
NSString *money = [formatter stringFromNumber:[NSNumber numberWithDouble:[str doubleValue]]];

return money;
}
```
NSNumberFormatter类有个属性`numberStyle`，是一个枚举型，设置不同的值可以输出不同的数字格式。该枚举包括：
```
/**
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
```
在所需控制器里调用测试,
```
#import "NSString+ZLMoney.h"
```
```
// 测试数据:
self.cost = @"94862.57";
// 一般标准金额格式￥94,862.57
costValue.text = [NSString stringChangeMoneyWithStr:self.cost];
// 选取枚举对应的金额数字格式
costValue.text = [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterCurrencyStyle];
```

**PS:注意! iOS11之后kCFNumberFormatterCurrencyStyle 在中文状态下前缀变成了CN￥不是￥.这里选择使用kCFNumberFormatterDecimalStyle然后拼接￥符号**
```
money = [NSString stringWithFormat:@"￥%@", money];
```

考虑到这种拼接情况,也可以自定义金额正数格式, 前缀可在根据自己项目需求随意添加!
使用NSNumberFormatter类的属性`positiveFormat`.
```
// 自定义正数格式(金额的格式转化) 94,862.57 前缀可在所需地方随意添加
+ (NSString *)stringChangeMoneyWithDouble:(double)number {

NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
formatter.positiveFormat = @",###.##"; // 正数格式
// 注意传入参数的数据长度，可用double
NSString *money = [formatter stringFromNumber:@(number)];
//    money = [NSString stringWithFormat:@"￥%@", money];

return money;
}
```

测试效果:
```
NSLog(@"NSNumberFormatterNoStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterNoStyle]);
NSLog(@"NSNumberFormatterDecimalStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterDecimalStyle]);
NSLog(@"NSNumberFormatterCurrencyStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterCurrencyStyle]);
NSLog(@"NSNumberFormatterPercentStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterPercentStyle]);
NSLog(@"NSNumberFormatterScientificStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterScientificStyle]);
NSLog(@"NSNumberFormatterSpellOutStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterSpellOutStyle]);
```

打印效果如下:

![模拟器中文状态下的人民币格式.png](https://github.com/ZLFighting/ZLMoneyDemo/blob/master/ZLMoneyDemo/模拟器中文状态下的人民币格式.png)

![模拟器美元格式.png](https://github.com/ZLFighting/ZLMoneyDemo/blob/master/ZLMoneyDemo/美元格式.png)


需要格式化金额的需求, 可以直接用上面的分类方法即可(使用numberStyle/positiveFormat两种均可).


NSNumberFormatter类有个属性numberStyle，是一个枚举型，设置不同的值可以输出不同的数字格式。该枚举包括：

```
/**
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
```


思路详情请移步技术文章:[iOS - 格式化金额,三位一逗号](http://blog.csdn.net/smilezhangli/article/details/78548348)

您的支持是作为程序媛的我最大的动力, 如果觉得对你有帮助请送个Star吧,谢谢啦

