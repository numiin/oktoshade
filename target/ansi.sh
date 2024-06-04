#!/bin/bash

declare -i index=0

echo '#!/bin/bash'
echo

./render "$1" |
  while read -r hex
  do
    if [[ $index -ge 16 ]]
    then
      echo "echo -en \"\\e]4;$index;$hex\\e\\\\\""
    fi
    index+=1
  done
