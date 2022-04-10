#!/bin/bash

# Constants
ALL_NON_RANDOM_WORDS="$HOME"/scripts/other/4chin
 
# total number of non-random words available
non_random_words=$(wc -l < "$ALL_NON_RANDOM_WORDS")
 
# number of random generated words depends on supplied argument
random_number=$(shuf -i 1-"$non_random_words" -n 1)
sed "$random_number""q;d" "$ALL_NON_RANDOM_WORDS"
