#!/bin/bash
source ~/opt/anaconda3/bin/activate cs380;

function test {
  python main.py --player=agent --train="$3" --screen="$1" --steps="$4" --restart="$2" --speed=fast
}

function eval {
  echo "$1 Screen Performance"
  python main.py --player=agent --screen="$1" --steps=100 --speed=fast
  echo "-------------------------------------------------------------"
}

for i in "2" "3" "4" "5" "6" "7" "8"; do
  test "hard" "$i" "q_best" "750"
done

for i in "4" "6" "8"; do
  test "medium" "$i" "q_best" "500"
done

for i in "easy" "medium" "hard"; do
  eval "$i"
done
