//
//  CXCard.m
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "CXCard.h"
@interface CXCard()
@end

@implementation CXCard

- (int)match:(NSArray *)otherCard
{
    int score = 0;
    
    for (CXCard*card in otherCard) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
    
}



@end
