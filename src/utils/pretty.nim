proc print*(year: int, day: int, result1: string, result2: string) =
  echo()
  echo "╭─ Advent of Code ", year, " - Day ", day, "─────────╮"
  echo "│";
  echo "│   Part 𝟙: ", result1;
  echo "│   Part 𝟚: ", result2;
  echo "│";
  echo "╰──────────────────────────────"
