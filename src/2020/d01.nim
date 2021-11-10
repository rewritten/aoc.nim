#[
#  Advent of code 2020 - Day 1
]#

import std/sets
import std/sequtils
import std/strutils
import std/tables

let
  data = readAll(stdin)
  numbers = splitLines(data).filterIt(it != "").mapIt(parseInt(it))

# part 1
var
  waiting = initHashSet[int]()

for n in numbers:
  if waiting.contains(n):
    echo "Part 1: ", n * (2020 - n)

    break
  else:
    waiting.incl(2020 - n)

# part 2
var products_of_two = initTable[int, (int, int)]()

for m in numbers:
  for n in numbers:
    products_of_two[2020 - m - n] = (m, n)

for m in numbers:
  if m in products_of_two:
    echo "Part 2: ", m * products_of_two[m][1] * products_of_two[m][0]

    break
