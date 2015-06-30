//
//  ViewController.m
//  CardGame
//
//  Created by Kelsey Pedersen on 6/29/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@end


@implementation ViewController

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"FlipCount changed to %d", self.flipCount);
}

// The name of the method, touchCardButton:, includes the semi-colon!
// IBAction returns void, uses IBAction instead of void so xcode knows its an action method, not just a regular method
- (IBAction)touchCardButton:(UIButton *)sender {
    
    // Chill way to check because works for nil and @""
    if ([sender.currentTitle length]) {

            [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                              forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {

            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
        [sender setTitle:@"A♣️" forState:UIControlStateNormal];
    }
    self.flipCount++;
    
}

@end
