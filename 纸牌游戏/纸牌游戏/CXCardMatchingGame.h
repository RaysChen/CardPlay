//
//  CXCardMatchingGame.h
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/12.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXCard.h"
#import "CXDeck.h"

@interface CXCardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(CXDeck *)deck;

- (void)choosenCardAtIndex:(NSInteger)index;
- (CXCard *)cardAtIndex:(NSUInteger)index;

@property (nonatomic , readonly) NSInteger score;


@end
