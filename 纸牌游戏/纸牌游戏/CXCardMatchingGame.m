//
//  CXCardMatchingGame.m
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/12.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXCardMatchingGame.h"

@interface CXCardMatchingGame ()

/**
 * 读写是默认的，这样写只是一种风格，写在私有接口，不让子类修改，score和.h文件的score是一个属性
 */
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;//CXCard类
@end

@implementation CXCardMatchingGame

//惰性实例化
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}


//初始化器
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(CXDeck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            CXCard *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
        
    }
    
    return self;
}


- (CXCard *)cardAtIndex:(NSUInteger)index

{       //"?" c语法，同if
        //(表达式)？x：y    [计算表达式，真返回x假返回y]
    return (index<[self.cards count]) ? self.cards[index] :nil;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


- (void)choosenCardAtIndex:(NSInteger)index
{
    //玩家选一张牌
    CXCard *card = [self cardAtIndex:index];
    
    //如果玩家选一张已经匹配过的牌，就忽略其行为
    //如果牌没有匹配过，那么
    if (!card.isMatched) {
        
        //如果纸牌被选择过，那么将它翻回去
        //getter用重命名的isChosen，setter用chosen
        if (card.isChosen) {
            card.chosen = NO;//两次选择＝no,一种开关
        
        }else{
            //选择另一张纸牌开始匹配
            //遍历数组找到otherCard
            for (CXCard *otherCard in self.cards) {
                
                //如果otherCard已经被选择and没有匹配过，那么：
                if (otherCard.isChosen && !otherCard.isMatched) {
                    
                                      //card与otherCard用match方法
                    int matchScore = [card match:@[otherCard]];//@[]创建一个数组，将otherCard放进去
                    
                    //如果匹配，那么
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS; //匹配得分，那么会乘以一个倍数红利
                        otherCard.matched = YES; //给两张牌都标记matched = YES
                        card.matched = YES;
                    }
                    //如果没有匹配，那么
                    else{
                        self.score -= MISMATCH_PENALTY;//不匹配减分
                        otherCard.chosen = NO;//为另一张牌取消选择
                        
                    }
                    //匹配完了就可以跳出for循环了
                    break;
                }
            }
            //翻牌会减分
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;//标记为已选
        
        }
    }

}
















@end
