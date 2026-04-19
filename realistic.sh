#!/bin/bash

# Random commits over last 365 days (natural pattern)

for i in {1..365}
do
  # Random number of commits per day (0 to 5)
  commits=$((RANDOM % 5))

  for j in $(seq 1 $commits)
  do
    DATE=$(date -v-"$i"d +"%Y-%m-%dT$((RANDOM % 24)):$(($RANDOM % 60)):00")

    echo "commit $i-$j" >> file.txt
    git add .
    GIT_COMMITTER_DATE="$DATE" GIT_AUTHOR_DATE="$DATE" git commit -m "update $i-$j"
  done
done
