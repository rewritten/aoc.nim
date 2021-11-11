#[
#  Advent of code 2020 - Day 2
]#

import std/parseutils
import std/sequtils
import std/strutils

proc parse(str: string): (int, int, string, string) =
  ##[ parse a line into the list of data ]##
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


proc 𝟙*(data: string): int =
  let lines = splitLines(data).filterIt(it != "")

  proc valid(line: string): bool =
    let
      (min, max, ch, pwd) = parse line
      count = pwd.count ch
    return min <= count and count <= max

  return lines.countIt valid it

proc 𝟚*(data: string): int =
  let lines = splitLines(data).filterIt(it != "")

  proc valid(line: string): bool =
    let (yes, no, ch, pwd) = parse line
    return pwd[yes - 1] == ch[0] xor pwd[no - 1] == ch[0]

  return lines.countIt valid it
