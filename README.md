##TicTacToe in Ruby

![](https://github.com/zlahham/tic_tac_toe/workflows/Lint,%20Build%20&%20Test/badge.svg)
[![Coverage Status](https://coveralls.io/repos/zlahham/tic_tac_toe/badge.svg?branch=master&service=github)](https://coveralls.io/github/zlahham/tic_tac_toe?branch=master)

Summary
-------
This is a game of Tic-Tac-Toe aka Noughts and Crosses, built in the Ruby language.
If you would like to read more on the rules of this game: [Wikipedia](https://en.wikipedia.org/wiki/Tic-tac-toe)

I built this game with the following restrictions:
- [x] Playable in 3 modes:
  - [x] Human VS Human
  - [x] Human VS Computer
  - [x] Computer VS Computer
- [x] When playing against the computer, the computer must never lose
- [x] The user should also have the choice of which player goes first.



Challenges & Learning Outcomes
------------------------------

I really enjoyed the whole project all the way from the paper sketches to passing the tests.

I found this a bit more complex that I would have imagined before starting it.
The complexity that I came across was mainly dealing with the AI (Computer player).

It was easy to get the computer to make a random move but then getting the algorithm right to make the "best" move took some time. I realised that I was approaching the problem from a messy angle and that caused the delays.
I then came across the [**MINIMAX**](https://en.wikipedia.org/wiki/Minimax) Algorithm after researching the matter extensively. This took me quite a while to understand and apply properly.
After hours and hours, I managed to successfully implement the algorithm and plug it into the Game.

I found it was a better approach to place all the Game rules in front of me and then write up the pseudo-code for it, bearing in mind the "best" moves.

I used the `guard` gem for this project, which I haven't used in a while. This really helped with the TDD aspect.

I also realised that when I got to completing the first Version (Human vs Human), the red-green-refactor cycle became a bit messy. This is something I aim to work on for the next project.

What helped me quite a lot throughout this project was to constantly play the Tic-tac-toe game against myself in order to visualise the "best" moves.





Future Plans
------------
- [ ] Test the MINIMAX properly
- [x] Clean up the runner file `lib/play_game.rb` => `bin/ttt`
- [x] Seperate the CLI code from the business logic
- [ ] Make a Web app version with Sinatra/Rails
- [x] Make the Command line version look nicer
- [ ] Use a game engine such as Gosu
- [ ] Make this into a Gem



Setup
-----
```
git clone git@github.com:zlahham/tic_tac_toe.git
or
git clone https://github.com/zlahham/tic_tac_toe.git

cd tic_tac_toe

bundle

bin/ttt
```
**Enjoy the Game!**



Testing
-------
```
git clone git@github.com:zlahham/tic_tac_toe.git

cd tic_tac_toe

bundle

rspec
```
