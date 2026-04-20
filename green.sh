#!/bin/bash

for i in {1..365}
do
  DATE=$(date -v-"$i"d +"%Y-%m-%dT12:00:00")
  echo "commit $i" >> file.txt
  git add .
  GIT_COMMITTER_DATE="$DATE" GIT_AUTHOR_DATE="$DATE" git commit -m "commit $i"
done
