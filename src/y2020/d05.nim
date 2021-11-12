#[
#  Advent of code 2020 - Day 5
]#
import std/algorithm
import std/sequtils
import std/strutils
import std/tables

let mapping = newTable([('F', 0), ('B', 1), ('R', 1), ('L', 0)])

iterator seatNumbers(data: string): int16 =
  for line in data.splitLines:
    if line != "":
      var n = 0
      for c in line:
        n = n * 2 + mapping[c]
      yield n.int16

proc 𝟙*(data: string): int16 =
  return data.seatNumbers.toSeq.max

proc 𝟚*(data: string): int16 =
  let soldSeats = data.seatNumbers.toSeq
  var allSeats : set[int16] = { soldSeats.min .. soldSeats.max }

  for seat in soldSeats:
    allSeats.excl seat

  return allSeats.toSeq.min
