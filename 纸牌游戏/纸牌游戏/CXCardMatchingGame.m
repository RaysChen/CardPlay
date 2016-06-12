//
//  CXCardMatchingGame.m
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/12.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXCardMatchingGame.h"

@interface CXCardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CXCardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}


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
{
    return (index<[self.cards count]) ? self.cards[index] :nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


- (void)choosenCardAtIndex:(NSInteger)index
{
    CXCard *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.chosen) {
            card.chosen = NO;
        }else{
            for (CXCard *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore  * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                    
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                        
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        
        }
    }

}
















@end
