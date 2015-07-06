//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Kelsey Pedersen on 7/2/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "CardMatchingGame.h"

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

@interface CardMatchingGame ()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic) NSInteger currentMatchCardFlipCount;
@property (nonatomic) NSInteger numberOfCardsToPlayWith;
@end

@implementation CardMatchingGame

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
          numberOfCardsToPlayWith:(NSInteger)numberOfCardsToPlayWith
{
    self = [super init];
    
    if (self){
        self.numberOfCardsToPlayWith = numberOfCardsToPlayWith;
        for (int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if (card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}



- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    // isChosen is the getter, as set in our property
    // chosen is the setter
    
    if (!card.isMatched){
        if (card.isChosen){
            card.chosen = NO;
            self.status = @"";
        }else{
            // Store the chose and not matched cards in currentChosenCards array
            NSMutableArray *currentChosenCards = [[NSMutableArray alloc]init];
            NSMutableString *statusCurrentChosenCards = [[NSMutableString alloc]init];
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    // Add 3 card logic
                    [currentChosenCards addObject:otherCard];
                    [statusCurrentChosenCards appendFormat:@"%@ ", otherCard.contents];
                }
            }
            if ([currentChosenCards count]){
                self.status = [[NSString stringWithFormat:@"Chose %@ to match with: ", card.contents] stringByAppendingString:statusCurrentChosenCards];
            } else {
                self.status = [NSString stringWithFormat:@"Chose %@", card.contents];
            }
            
            // Our model is keeping track of # of cards currently chosen and not matched
            // So we need to match that count with the # of cards we are playing with
            // -1 is used b/c currentChosenCards doesn't include the card just clicked
            
            if ([currentChosenCards count] == self.numberOfCardsToPlayWith-1){
                
                int matchScore = [card match:currentChosenCards];
                if (matchScore){
                    self.score += matchScore * MATCH_BONUS;
                    for (Card *otherCard in currentChosenCards){
                        otherCard.matched = YES;
                    }
                    card.matched = YES;
                    self.status = [[NSString stringWithFormat:@"Scored: %d. Match found for: %@ ", matchScore * MATCH_BONUS, card.contents] stringByAppendingString:statusCurrentChosenCards];
                } else {
                    self.score -= MISMATCH_PENALTY;
                    for (Card *otherCard in currentChosenCards){
                        otherCard.chosen = NO;
                    }
                    self.status = [[NSString stringWithFormat:@"Penalty: %d. No match found for: %@ ", MISMATCH_PENALTY, card.contents]stringByAppendingString:statusCurrentChosenCards];
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    [self shouldDisableGame];
}


- (void)shouldDisableGame
{
    NSMutableArray *cardsRemaining = [[NSMutableArray alloc]init];
    for (Card *otherCard in self.cards){
        if (!otherCard.isMatched) {
            [cardsRemaining addObject:otherCard];
        }
    }
    if ([cardsRemaining count] && ([cardsRemaining count] <= self.numberOfCardsToPlayWith)){
        Card *firstCard = [cardsRemaining firstObject];
        NSMutableArray *cardsToMatch = [[NSMutableArray alloc]initWithArray:cardsRemaining];
        [cardsToMatch removeObjectAtIndex:0];
        int possibleMatchScore = [firstCard match:cardsToMatch];
        
        if (!possibleMatchScore){
            for (Card *card in cardsRemaining){
                NSLog(@"Remaining cards: %@", card.contents);
                card.matched = YES;
            }
        }
    }
}



- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (instancetype)init
{
    return nil;
}

@end
