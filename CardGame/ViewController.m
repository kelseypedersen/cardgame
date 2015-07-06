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
#import "Deck.h"

@interface ViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@property (weak, nonatomic) IBOutlet UISegmentedControl *matchModeControl;
@property (weak, nonatomic) IBOutlet UILabel *matchModeLabel;
@property (nonatomic) NSInteger numberOfCardsToPlayWith;

@end

// To Do List
// Add MatchModeLavel


@implementation ViewController


- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}


- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]
                                            numberOfCardsToPlayWith:self.numberOfCardsToPlayWith];
    return _game;
}



- (IBAction)chooseMatchMode:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 1){
        self.numberOfCardsToPlayWith = 3;
        self.matchModeLabel.text = @"Match Model is 3 cards!";
        NSLog(@"Value of mode changed to 3");
    }else{
        self.numberOfCardsToPlayWith = 2;
        self.matchModeLabel.text = @"Match Model is 2 cards!";
        NSLog(@"Value of mode changed to 3");
    }
}



- (NSInteger)numberOfCardsToPlayWith
{
    if (!_numberOfCardsToPlayWith) _numberOfCardsToPlayWith = 2;
    return _numberOfCardsToPlayWith;
}


- (IBAction)redealCardsAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Redeal, fo real?"
                                                    message:@"This will reset your current score"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"okay", nil];
    
    [alert show];
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self redealCards];
    }
}




- (void)redealCards
{
    self.game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]
                                    numberOfCardsToPlayWith:self.numberOfCardsToPlayWith];
    if (!self.matchModeControl.enabled) self.matchModeControl.enabled = YES;
    [self updateUI];
}




- (IBAction)flipCard:(UIButton *)sender
{
    // Do I need this?!
    //if (self.matchModeControl.enabled) self.matchModeControl.enabled = NO;
    NSInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}


- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        NSInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
//    self.statusLabel.text = self.game.status;
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
