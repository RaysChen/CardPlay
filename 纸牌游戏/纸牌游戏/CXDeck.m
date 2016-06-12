//
//  CXDeck.m
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXDeck.h"


@interface CXDeck()
@property (strong ,nonatomic) NSMutableArray *cards;
@end

@implementation CXDeck

- (NSMutableArray *)cards
{
    if (!_cards)_cards = [[NSMutableArray alloc]init];//如果实例变量_cards没有值，那么在堆中分配存储空间给可变数组对象，并赋值给实例变量_cards
    return  _cards;
}

- (void)addCard:(CXCard *)card atTop:(BOOL)atTop
{   //如果要加在一堆牌的最上面，就用第一句；不是就用第二句；此处仅作为展示insertObject 和addObject的不同用法
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }else {
        [self.cards addObject:card];
    }

}

- (void)addCard:(CXCard *)card
{
    [self addCard:card atTop:NO];
}

- (CXCard*)drawRandomCard //此方法用来随机抽取一张牌
{
    CXCard *randomCard = nil;
    
    //如果cards数组中有内容就执行
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count]; //arc4random()获取一个随机整数，与纸牌的数目求余，作为下标
        randomCard = self.cards[index]; //将随机得到的这个下标的牌赋值给randomCard
        [self.cards removeObjectAtIndex:index];//将抽出的牌从cards数组中删除
    }
    
    return  randomCard;
}

@end
