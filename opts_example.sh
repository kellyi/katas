#!/bin/sh

echo there were $# options: $@

while getopts ":hjkl" opt; do
  case $opt in
    h)  echo hello
        ;;
    j)  echo jello
        ;;
    k)  echo kelly
        ;;
    l)  echo lello
        ;;
    \?) echo "-$OPTARG isn't valid"
        ;;
  esac
done
