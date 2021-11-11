#[
#  Advent of code 2020 - Day 1
]#

import std/sets
import std/sequtils
import std/strutils
import std/tables

proc 𝟙*(data: string): int =
  let numbers = splitLines(data).filterIt(it != "").mapIt(parseInt(it))
  var waiting = initHashSet[int]()

  for n in numbers:
    if waiting.contains(n):
      return n * (2020 - n)
    else:
      waiting.incl(2020 - n)

proc 𝟚*(data: string): int =
  let numbers = splitLines(data).filterIt(it != "").mapIt(parseInt(it))
  var products_of_two = initTable[int, (int, int)]()

  for m in numbers:
    for n in numbers:
      products_of_two[2020 - m - n] = (m, n)

  for m in numbers:
    if m in products_of_two:
      let (n, o) = products_of_two[m]
      return m * n * o
