# Card Game

## Stanford 193P Lecture

### Monday, June 29th

**What I Learned Today**
```
- Create xcode project setup
- Connect project to Github
- Create Card, Deck, PlayingCard, PlayingCardDeck models
- Difference between strong and weak
- Create properties for model in header file
- If related to superclass, no need to add properties already defined in the superclass
- + means class method, - means instance method
- Use @synthesize when implementing both getter and setter for a property
```

**Questions I still have**
```
- Why is the cards property defined in the implementation file not the header file? Does it have something to do with being private vs. public? 
- What is unsigned? e.g. unsigned index in deck.m
- How does self.cards count return a boolean statement to be used in an if statement? Does it only respond false if it is nil? 
- How does stringByAppendingString work? I may be overthinking it, but it seems like it appends the argument with the method, and is that it? 
- How do you determine if something is a class or instance method? Still do not clearly understand why validSuits and maxRank are class methods. 
- How does (instancetype)init work in the PlayingCardDeck.m file? In the lecture, the professor stated it was only used to test if you can initialize the superclass. Would it still work if you substitute self for another variable name, or does self hold unique meaning for this situation?
```
