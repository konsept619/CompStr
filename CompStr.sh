#!/bin/bash


flag_used=0

display_help(){
  echo "Help"
}

while getopts "ih" flag; do
  case "$flag" in
    i)
      flag_used=1
      FIRST_STR=$(echo "$2" | tr -d ' '| tr '[:lower:]' '[:upper:]' )
      SECOND_STR=$(echo "$3" | tr -d ' ' | tr '[:lower:]' '[:upper:]' )
      shift
      ;;
    h) display_help
      exit 0
      ;;
    \?)
      echo "You passed wrong arguments! Read usage info!"
      exit 1
      ;;
  esac
done

if [ "$flag_used" -ne 1 ]; then

  FIRST_STR=$(echo "$1" | tr -d ' ')
  SECOND_STR=$(echo "$2" | tr -d ' ')
fi



#echo "This is first string: $FIRST_STR, and this is the second one: $SECOND_STR"
if [ $FIRST_STR = $SECOND_STR ]; then
  echo "Both strings are the same."
  exit 0
else 
  echo "Strings are not the same!"
  exit 1
fi

