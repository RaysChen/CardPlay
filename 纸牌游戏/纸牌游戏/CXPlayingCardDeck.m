//
//  CXPlayingCardDeck.m
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXPlayingCardDeck.h"
#import "CXPlayingCard.h"

@implementation CXPlayingCardDeck

//重写间接继承者NSObject的init方法
//init方法永远返回self
- (instancetype)init
{
    self = [super init];//oc中也只有这里会给self赋值
    
    if (self) {
        //for遍历所有花色
        //for遍历所有大小
        for (NSString *suit in [CXPlayingCard validSuits]) {
            for (NSInteger rank = 1; rank <= [CXPlayingCard maxRank]; rank++) {
               
                //创建一张牌
                CXPlayingCard *card = [[CXPlayingCard alloc]init];
                
                //设置rank,suit
                card.rank = rank;
                card.suit = suit;
                
                //添加到自身
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
