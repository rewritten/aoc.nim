#[
#  Advent of code 2020 - Day 6
]#

import std/strutils

proc 𝟙*(data: string): int =
  for group in data.split("\n\n"):
    var ans: set[char] = {}
    for c in group: ans.incl c
    ans.excl '\n'
    result += len(ans)

proc 𝟚*(data: string): int =
  for group in data.split("\n\n"):
    var ans: set[char] = {'a'..'z'}
    for line in group.splitLines:
      var chrs: set[char]
      for c in line: chrs.incl c
      ans = ans * chrs
    result += len(ans)
