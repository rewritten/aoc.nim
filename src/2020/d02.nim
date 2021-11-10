#[
#  Advent of code 2020 - Day 2
]#

import std/parseutils
import std/sequtils
import std/strutils

proc parse(str: string): (int, int, string, string) =
  # 11-16 h: thhrhrwhbshshsdhhhhr
  var
    pos = 0
    min = ""
    max = ""
    ch = ""
    pwd = ""

  pos += parseUntil(str, min, '-', pos) + 1
  pos += parseUntil(str, max, ' ', pos) + 1
  pos += parseUntil(str, ch, ':', pos) + 2
  discard parseUntil(str, pwd, '\n', pos)

  return (parseInt(min), parseInt(max), ch, pwd)

let
  data = readAll(stdin)
  lines = splitLines(data).filterIt(it != "")

# part 1
proc validPartOne(line: string): bool =
  let
    (min, max, ch, pwd) = parse line
    count = pwd.count ch
  return min <= count and count <= max

echo "Part 1: ", lines.countIt validPartOne it

# part 2
proc validPartTwo(line: string): bool =
  let (yes, no, ch, pwd) = parse line
  return pwd[yes - 1] == ch[0] xor pwd[no - 1] == ch[0]

echo "Part 2: ", lines.countIt validPartTwo it
