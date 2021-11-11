#[
#  Advent of code 2020 - Day 3
]#

import std/sequtils
import std/strutils

iterator lines(data: string): seq[char] =
  for line in splitLines(data):
    if line != "": yield line.toSeq()

iterator traverse(map: seq[seq[char]], start: (int, int), dir: (int, int)): char =
  let
    (dx, dy) = dir
    size = len(map[0])

  var (x, y) = start

  yield map[x][y mod size]

  while true:
    x += dx
    y += dy
    if x >= len(map): break
    yield map[x][y mod size]

proc countTrees(data: string, dy: int, dx: int): int =
  for ch in traverse(toSeq(lines(data)), (0, 0), (dx, dy)):
    if ch == '#': result += 1

proc 𝟙*(data: string): int =
  return countTrees(data, 3, 1)

proc 𝟚*(data: string): int =
  return countTrees(data, 1, 1) * countTrees(data, 3, 1) * countTrees(data, 5,
      1) * countTrees(data, 7, 1) * countTrees(data, 1, 2)
