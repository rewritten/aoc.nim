#[ This file is not meant to be run by itself ]#

import src/y__YEAR__/d__DAY__

let data = readFile("inputs/__YEAR__/__DAY__.txt")

echo()
echo "╭─ Advent of Code ", __YEAR__, " - Day ", __DAY__, " ─────────╮"
echo "│"
echo "│   Part 𝟙: ", 𝟙(data)
echo "│   Part 𝟚: ", 𝟚(data)
echo "│"
echo "╰──────────────────────────────"
