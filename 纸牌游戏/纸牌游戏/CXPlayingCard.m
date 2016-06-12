//
//  CXPlayingCard.m
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXPlayingCard.h"

@implementation CXPlayingCard

//重写从CXCard继承来的contents属性的getter方法，设置牌的内容
- (NSString *)contents
{
    NSArray *rankStrings = [CXPlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];//无缝拼接字符串和数组
}


//因为同时提供了setter和getter
@synthesize suit = _suit;


+ (NSArray *)validSuits
{
    return @[@"♥︎",@"♣︎",@"♠︎",@"♦︎"];
}


//防止设置错suit，进行一次验证再设置
- (void)setSuit:(NSString *)suit
{         //调用类方法               //containsObject方法：比较前后是否一样
    if ([[CXPlayingCard validSuits]containsObject:suit]) {
        _suit = suit;
    }
}


//重写suit的getter方法，如果为空，返回“？”否则返回实际的值
- (NSString *)suit
{
    
    return _suit ?_suit :@"?";
}


+ (NSArray *)rankStrings
{   //所有实例变量都是从0开始的，设置“？”保护KPI
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];//
}


+ (NSUInteger)maxRank
{
    return [[self rankStrings]count] -1;
}


//重写rank的setter，保证不会设置错误的牌大小的值
- (void)setRank:(NSInteger)rank
{
    if (rank <= [CXPlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
