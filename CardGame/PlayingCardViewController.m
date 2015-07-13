//
//  PlayingCardViewController.m
//  CardGame
//
//  Created by Kelsey Pedersen on 7/13/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc]init];
}

@end
