Chess club administration app
Intro
The local chess club wants to keep track of their members. The main thing that they want to
keep track of, is the ranking of each member.

Basic CRUD
They need a basic system to Create, Show Update and Delete members. They only need basic
information about each member:
● Name and surname - Done
● Email address- Done
● Birthday- Done
● Number of club games played- Done
● Current rank- Done

Ranking
Each member is ranked from 1..n. Where 1 is the top player in the club and n is the
lowest-ranked player in the club.

When players play a match, their ranks can change, based on the following rules:
● If the higher-ranked player wins against their opponent, neither of their ranks change - Done

● If it’s a draw, the lower-ranked player can gain one position, unless the two players are
adjacent. So if the players are ranked 10th and 11th, and it’s a draw, no change in
ranking takes place. But if the players are ranked 10th and 15th, and it’s a draw, the
player with rank 15 will move up to rank 14 and the player with rank 10 will stay the
same

● If the lower-ranked player beats a higher-ranked player, the higher-ranked player will
move one rank down, and the lower level player will move up by half the difference
between their original ranks.

For example, if players ranked 10th and 16th play and the lower-ranked player wins, the
first player will move to rank 11th and the other player will move to rank (16 - 10) / 2 = 3
placed up, to rank 13th - Done


The application
Write a simple application that will help the chess club administer their players.

The application will need all the basic CRUD operations. 
New players will, by default, be ranked last. - Done

The application will also need a facility to enter a match between two players and then update
their ranks accordingly.

A leader board view will be used by the club.
