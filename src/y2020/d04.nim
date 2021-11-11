#[
#  Advent of code 2020 - Day 4
]#

import std/sequtils
import std/strutils
import std/tables

proc filled(passport: Table[string, string]): bool =
    return
        passport.hasKey("byr") and
        passport.hasKey("iyr") and
        passport.hasKey("eyr") and
        passport.hasKey("hgt") and
        passport.hasKey("hcl") and
        passport.hasKey("ecl") and
        passport.hasKey("pid")

proc valid(passport: Table[string, string]): bool =
    return
        filled(passport) and
        parseInt(passport["byr"]) in 1920 .. 2002 and
        parseInt(passport["iyr"]) in 2010 .. 2020 and
        parseInt(passport["eyr"]) in 2020 .. 2030 and
        (len(passport["hgt"]) == 4 and parseInt(passport["hgt"][0..1]) in 59 .. 76 and passport["hgt"][2..3] == "in" or
           len(passport["hgt"]) == 5 and parseInt(passport["hgt"][0..2]) in 150 .. 193 and passport["hgt"][3..4] == "cm") and
        len(passport["hcl"]) == 7 and passport["hcl"][0] == '#' and allIt(passport["hcl"][1..6], it in {'0'..'9', 'a'..'f'}) and
        passport["ecl"] in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"] and
        len(passport["pid"]) == 9 and allIt(passport["pid"], it in {'0'..'9'})

proc parsePassport(s: string): Table[string, string] =
    let fields = s.split({' ', '\t', '\n', '\r'})
    var passport = Table[string, string]()
    for field in fields:
        if field != "":
            let kv = field.split(':')
            passport[kv[0]] = kv[1]
    return passport

iterator split(data: string): Table[string, string] =
    for s in data.split("\n\n"):
        yield parsePassport(s)

proc 𝟙*(data: string): int =
    for p in split(data):
        if p.filled: result += 1

proc 𝟚*(data: string): int =
    for p in split(data):
        if p.valid: result += 1
