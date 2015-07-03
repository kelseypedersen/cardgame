//
//  ViewController.m
//  CardGame
//
//  Created by Kelsey Pedersen on 6/29/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end


@implementation ViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}


- (IBAction)flipCard:(UIButton *)sender
{
    NSInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        NSInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}


 - (NSString *)titleForCard:(Card *)card
    {
        return card.isChosen ? card.contents : @"";
    }

- (UIImage *)backgroundImageForCard:(Card *)card
    {
        return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
    }
    

//// Delete when delete flips label
//- (void)setFlipCount:(int)flipCount {
//    _flipCount = flipCount;
//    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
//    NSLog(@"FlipCount changed to %d", self.flipCount);
//}

@end
