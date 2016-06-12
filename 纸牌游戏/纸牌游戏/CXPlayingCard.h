//
//  CXPlayingCard.h
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

/**
 *此子类用来表示具体扑克牌
 */
#import "CXCard.h"

@interface CXPlayingCard : CXCard
@property (strong ,nonatomic) NSString *suit; //牌的花色
@property (nonatomic) NSInteger rank;//牌的数字

//类方法作用：1.创建事物 2.设置通用的返回，做工具方法
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
