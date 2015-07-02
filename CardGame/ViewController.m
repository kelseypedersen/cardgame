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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) PlayingCardDeck *playingCardDeck;

@end


@implementation ViewController

- (Deck *)deck {
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}


- (IBAction)flipCard:(UIButton *)sender {

//    // Chill way to check because works for nil and @""
    if ([sender.currentTitle length]) {

        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];


    } else {
        Card *card = [self.deck drawRandomCard];
        if (card){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}


- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"FlipCount changed to %d", self.flipCount);
}

@end
