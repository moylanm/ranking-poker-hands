# Ruby Challenges / Ranking Poker Hands

Hey there! We're [thoughtbot](https://thoughtbot.com), a design and
development consultancy that brings your digital product ideas to life.
We also love to share what we learn.

This coding exercise comes from [Upcase](https://thoughtbot.com/upcase),
the online learning platform we run. It's part of the
[Ruby Challenges](https://thoughtbot.com/upcase/ruby-challenges) course and is just one small sample of all
the great material available on Upcase, so be sure to visit and check out the rest.

## Exercise Intro

Difficulty: **Easy**

Write a program that accepts two poker hands and returns the winner.

## Instructions

To start, you'll want to clone and run the setup script for the repo

    git clone git@github.com:thoughtbot-upcase-exercises/ranking-poker-hands.git
    cd ranking-poker-hands
    bin/setup

Write a program to evaluate poker hands and determine a winner.

This [guide to poker hand strengths](https://www.pokerstars.com/poker/games/rules/hand-rankings/) maybe useful.

Your program should accept hands in the following representation:

```
# This is a hand with
# an Ace of spades,
# a King of diamonds,
# a Ten of hearts,
# a Jack of clubs,
# and a Queen of hearts.
["AS", "KD", "TH", "JC", "QH"]

# Another hand:
["2C", "5D", "9S", "3H", "TS"]
```

Assume all hands have five cards.

Your program should accept two hands and return the winning hand.

Example usage:

```
hand_1 = %w(2S 2D AH 3S 5S)
hand_2 = %w(2H 2C KH 5H 9C)

HandEvaluator.new.return_stronger_hand(hand1, hand2)
  # => ["2S", "2D", "AH", "3S", "5S"]
```

Note that you must handle ties. In the example above, both hands have a pair, but `hand_1` has a higher "kicker" (the Ace).

Make sure your test suite encodes these rules as clearly as possible. Imagine someone wasn't familiar with the rules of hand rankings&mdash;would your tests be a good guide?

## Featured Solution

Check out the [featured solution branch](https://github.com/thoughtbot-upcase-exercises/ranking-poker-hands/compare/featured-solution#toc) to
see the approach we recommend for this exercise.

## Forum Discussion

If you find yourself stuck, be sure to check out the associated
[Upcase Forum discussion](https://forum.upcase.com/t/ruby-challenges-ranking-poker-hands/4606)
for this exercise to see what other folks have said.

## Next Steps

When you've finished the exercise, head on back to the
[Ruby Challenges](https://thoughtbot.com/upcase/ruby-challenges) course to find the next exercise,
or explore any of the other great content on
[Upcase](https://thoughtbot.com/upcase).

## License

ranking-poker-hands is Copyright © 2015-2018 thoughtbot, inc. It is free software,
and may be redistributed under the terms specified in the
[LICENSE](/LICENSE.md) file.

## Credits

![thoughtbot](https://presskit.thoughtbot.com/assets/images/logo.svg)

This exercise is maintained and funded by
[thoughtbot, inc](http://thoughtbot.com/community).

The names and logos for Upcase and thoughtbot are registered trademarks of
thoughtbot, inc.
