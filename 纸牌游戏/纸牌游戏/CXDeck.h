//
//  CXDeck.h
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXCard.h"

@interface CXDeck : NSObject

- (void)addCard:(CXCard *)card atTop:(BOOL)atTop;
- (void)addCard:(CXCard *)card;

- (CXCard *)drawRandomCard;

@end
