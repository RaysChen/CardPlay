//
//  ViewController.m
//  纸牌游戏
//
//  Created by 陈曦 on 16/6/10.
//  Copyright © 2016年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "CXPlayingCardDeck.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong ,nonatomic)CXDeck *deck;

@end

@implementation ViewController

- (CXDeck*)deck
{
    if (!_deck)_deck = [self creatDeck];
    return _deck;
        
}

-(CXDeck*)creatDeck
{
    return [[CXPlayingCardDeck alloc]init];
}



- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"   flips : %d", self.flipCount];
    NSLog(@"flipcount change %d", self.flipCount);

}

- (IBAction)touchCardButton:(UIButton *)sender
{
    
    if ([sender.currentTitle length]) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"stanford"]
                            forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];

    }else{
        CXCard *randomCard = [self.deck drawRandomCard];
        
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"blank card rounded corner"]
                              forState:UIControlStateNormal];
            [sender setTitle:randomCard .contents forState:UIControlStateNormal];
        }

    }
    
    self.flipCount ++;
}

@end
