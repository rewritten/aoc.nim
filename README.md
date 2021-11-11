# aoc.nim

Advent of code (not yet) solved in Nim

## Downloading inputs and instructions

Log in to AOC with your browser. Get the session string from your cookies
and expose it as `SESSION` environment variable.

Now you can run `bin/get 2021 1` and similar commands to:

- download your input file
- download the instructions (converting them to markdown format)
- create a placeholder `.nim` file in which to implement the solution

You will need `nokogiri` (the ruby gem) installed globally, and `pandoc` (the
amazing document converter written in Haskell) too.

The solution template exports two procedures, aptly named `𝟙` and `𝟚` (the
unicode double-stroke numbers).

## Running the solution

When you have your code ready, just run `bin/run 2021 1` and similar commands
to run the solution and print out the result.
