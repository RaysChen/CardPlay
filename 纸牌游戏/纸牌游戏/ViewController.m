//
//  ViewController.m
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "CXPlayingCardDeck.h"
#import "CXCardMatchingGame.h"



@interface ViewController ()

@property (strong ,nonatomic)CXCardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

- (CXCardMatchingGame *)game
{
    if (!_game)_game = [[CXCardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self creatDeck]];
    
    return _game;
}


-(CXDeck*)creatDeck
{
    return [[CXPlayingCardDeck alloc]init];
}



- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game choosenCardAtIndex:chosenButtonIndex];
    [self updateUI];
    
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        CXCard *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card ]forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@" score %d",self.game.score];
    }
    
    
}

- (NSString *)titleForCard: (CXCard *)card
{
    return card.isChosen ? card.contents :@"";
}

- (UIImage *)backgroundImageForCard:(CXCard *)card
{
    return [UIImage imageNamed:card.isChosen ? @"blank card rounded corner":@"stanford"];
}


@end
