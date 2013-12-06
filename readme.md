Conway's Game of Life
=====================

This is an implementation of [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) which I'm using to try out a different TDD workflow and just hack around on.

Rules
-----

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overcrowding.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

To install
----------

```
$ git clone git@github.com:andypike/game_of_life.git
$ cd game_of_life
$ bundle
```

To run
------

```
$ ruby game_of_life.rb
```

Patterns
--------

If you run the simulation you will eventually get to a state where you start seeing some common patterns. See the [examples of patterns](http://en.wikipedia.org/wiki/Conway's_Game_of_Life#Examples_of_patterns) on Wikipedia.

Here is a screenshot from this implementation once it reached a stable state and the common patterns emerge:

![Profile picture](https://raw.github.com/andypike/game_of_life/master/game_of_life_patterns.png)