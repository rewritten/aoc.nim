#[
#  Advent of code 2020 - Day 1
]#

import std/intsets
import std/sequtils
import std/strutils
import std/tables

iterator numbers(data: string): int =
  for line in splitLines(data):
    if line != "":
      yield parseInt line

proc 𝟙*(data: string): int =
  var waiting = initIntSet()

  for n in numbers(data):
    if n in waiting:
      return n * (2020 - n)
    else:
      waiting.incl(2020 - n)

proc 𝟚*(data: string): int =
  let ns = toSeq(numbers(data))
  var pairwise_products = initTable[int, int]()

  for m in ns:
    for n in ns:
      pairwise_products[2020 - m - n] = m * n

  for m in ns:
    if m in pairwise_products:
      return m * pairwise_products[m]
