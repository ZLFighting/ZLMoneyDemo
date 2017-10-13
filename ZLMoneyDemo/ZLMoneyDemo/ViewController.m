//
//  ViewController.m
//  ZLMoneyDemo
//
//  Created by ZL on 2017/8/17.
//  Copyright © 2017年 zhangli. All rights reserved.
//

#import "ViewController.h"
#import "NSString+ZLMoney.h"

@interface ViewController ()

// 成本
@property (nonatomic, copy) NSString *cost;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    // 测试数据:
    self.cost = @"1194862.57";
    
    // 成本值
    UILabel *costValue = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    costValue.font = [UIFont systemFontOfSize:20];
    costValue.textColor = [UIColor redColor];
    costValue.textAlignment = NSTextAlignmentCenter;
    // 调用
//    costValue.text = [NSString stringChangeMoneyWithStr:self.cost];
//    costValue.text = [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterCurrencyStyle];
    costValue.text = [NSString stringChangeMoneyWithDouble:[self.cost doubleValue]];
    [self.view addSubview:costValue];
    
    // 打印查看 各个枚举对应输出金额数字格式的效果如下:
    NSLog(@"一般标准金额格式: %@", costValue.text);

    NSLog(@"NSNumberFormatterNoStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterNoStyle]);
    NSLog(@"NSNumberFormatterDecimalStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterDecimalStyle]);
    NSLog(@"NSNumberFormatterCurrencyStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterCurrencyStyle]);
    NSLog(@"NSNumberFormatterPercentStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterPercentStyle]);
    NSLog(@"NSNumberFormatterScientificStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterScientificStyle]);
    NSLog(@"NSNumberFormatterSpellOutStyle== %@", [NSString stringChangeMoneyWithStr:self.cost numberStyle:NSNumberFormatterSpellOutStyle]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
