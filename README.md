# Card Game - Stanford 193P Course

## Monday, June 29th

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

## Thursday, July 2nd

**What I Learned Today**
```
- Every component of the app belongs in a model, e.g. the game
- Use 'static const int' to define constants above the method
- Override superclasses methods
- Set background images and titles in the controller
- Count is 32bit and integer is 64bit
- Set properties as readonly
- Create array collections (cards on the view)
```

**Questions I still have**
```
- Difference between UIControlStateNormal and UIControlStateSelected
- Creation of unique init methods
- Why use readonly
- Use of self: not always sure what self is referencing
- Use of NSInteger and NSUInteger
```

## Sunday, July 5th

**What I Learned Today**
```
- There's such a thing as custom initializers! So awesome.
- firstObjects (similar to .first in ruby) - returns the first object in an array
- Use of alerts!
- Importance of not changing the IBAction/Outlet links in the viewController, or they will not work
- Use of NSMutableCopy in copying an array (that you want to change)
- isEqualToString is pretty sweet
- How to write a method to disable the program when the remaining cards do not match
- UISegmentedControl

```

**Questions I still have**
```
- the _methodname syntax - does this indicate an instantiated object or instance variable?
- The difference between self.methodName and self methodName
- In properties, why NSStrings have * in front of them vs. NSIntegers do not - I know it has something to do with being a pointer, but want to dive into this deeper.
- The use of count to determine if an array is empty or not - What are other ways to do this? 
- Why would you use isEqualToString instead of "=="?

```
