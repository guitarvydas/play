#!/usr/bin/env bash

curl -H "Authorization: $2" https://api.kinopio.club/space/$1 > kinopio.tmp
# curl --verbose -H "Authorization: $2" https://api.kinopio.club/space/$1 > kinopio.tmp
##curl -s https://api.kinopio.club/space/$1 > kinopio.tmp
##curl -s -H "Authorization: $2" https://api.kinopio.club/space/$1 > kinopio2.tmp
#curl -H "Authorization: $2" https://api.kinopio.club/space/$1 > kinopio3.tmp
# https://api.kinopio.club

# echo ---
# echo -n "title: "
# cat kinopio.tmp | jq .name
# echo -n "date: "
# cat kinopio.tmp | jq .updatedAt
# echo "layout: layouts/post.njk"
# echo ---

# cat kinopio.tmp | jq -r '.cards | sort_by(.y) | sort_by(.x) | .[] | .name + "\n"'

# rm kinopio.tmp
