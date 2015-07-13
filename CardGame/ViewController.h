//
//  ViewController.h
//  CardGame
//
//  Created by Kelsey Pedersen on 6/29/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

// Abstract class. Must implement methods as described below.

@interface ViewController : UIViewController < UIAlertViewDelegate >

// for subclasses
- (Deck *)createDeck; // abstract



@end

