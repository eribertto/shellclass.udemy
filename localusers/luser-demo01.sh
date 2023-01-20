#!/bin/bash

# This script displays various information to the screen

echo 'Hello'
# add a constant variable big case
WORD='script'
# call that variable
echo "This is a shell $WORD"

# demonstrate that single quotes do not do shell expansion
echo '$WORD'

# use another alternative syntax
echo "Another syntax using brace expansion: This is a shell ${WORD}"
# append text to the variable using brace expansion
echo "${WORD}ing is fun!"
# this doesnt work
echo "$WORDing is fun! ( doesnt work )"
# new variable
ENDING='ed'

# combine the two variables aka concatenate
echo "This is ${WORD}${ENDING}."

# variable re-assignment
ENDING='ing'
echo "${WORD}${ENDING} is fun!."

# another reassignment
echo "You are going to write many ${WORD}s in this class!"
