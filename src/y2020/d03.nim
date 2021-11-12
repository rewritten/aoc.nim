#[
#  Advent of code 2020 - Day 3
]#

import std/sequtils
import std/strutils

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

proc countTrees(map: seq[seq[char]], dy: int, dx: int): int =
  return toSeq(traverse(map, (0, 0), (dx, dy))).count('#')

proc 𝟙*(data: string): int =
  let map = data.splitLines.mapIt(toSeq it)
  return countTrees(map, 3, 1)

proc 𝟚*(data: string): int =
  let map = data.splitLines.mapIt(toSeq it)
  return countTrees(map, 1, 1) * countTrees(map, 3, 1) * countTrees(map, 5,
      1) * countTrees(map, 7, 1) * countTrees(map, 1, 2)
