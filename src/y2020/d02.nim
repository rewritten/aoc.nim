#[
#  Advent of code 2020 - Day 2
]#

import std/strutils
import std/sugar

iterator parse(data: string): (int, int, char, string) =
  ##[
    Parse lines into tuples of data.

    Given "11-16 h: thhrhrwhbshshsdhhhhr" it will yield (11, 16, 'h', "thhrhrwhbshshsdhhhhr").
    ]##

  for line in splitLines(data):
    if line != "":
      let t = collect:
        for (token, isSep) in tokenize(line, {' ', '-', ':'}):
          if not isSep: token
      yield (parseInt(t[0]), parseInt(t[1]), t[2][0], t[3])

proc 𝟙*(data: string): int =
  var count = 0
  for (min, max, ch, pwd) in parse(data):
    if pwd.count(ch) in min .. max:
      count += 1
  return count

proc 𝟚*(data: string): int =
  var count = 0
  for (lft, rgt, ch, pwd) in parse(data):
    if pwd[lft - 1] == ch xor pwd[rgt - 1] == ch:
      count += 1
  return count
