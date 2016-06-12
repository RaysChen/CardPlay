//
//  CXCard.h
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXCard : NSObject
@property (strong , nonatomic) NSString *contents;

@property (nonatomic , getter=isChosen) BOOL chosen;
@property (nonatomic , getter=isMatched) BOOL matched;

- (int)match :(NSArray *)otherCard;

@end
