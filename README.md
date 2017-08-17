# ZLMoneyDemo
iOS - 格式化金额,三位一逗号


思路详情请移步技术文章:[iOS - 格式化金额,三位一逗号](http://www.jianshu.com/p/f58a9599ffe2)

您的支持是作为程序媛的我最大的动力, 如果觉得对你有帮助请送个Star吧,谢谢啦

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

