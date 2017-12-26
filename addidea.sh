#!/usr/bin/sh

# Add some lines to the ideas.md file
# First argument idea title
# Second argument idea desc
# Otherwise bullet point
# sudo ln -rs addidea.sh /usr/bin/addidea

FILE="ideas.md"

if [ $IDEA_DIR ]
then
  cd $IDEA_DIR
else
  cd ~/Documents/ideas
fi

printf "\n" >> "$FILE"

i=1
for INPUT in "$@"
do

  # Arg 1: Idea title
  if [ "$i" -eq 1 ]
  then
    echo "## $INPUT" >> "$FILE"
  fi

  # Arg 2: Idea description on line below
  if [ "$i" -eq 2 ]
  then
    echo "$INPUT" >> "$FILE"
  fi

  # Remaining args: Idea bullet point
  if [ "$i" -ge 3 ]
  then
    echo "- $INPUT" >> "$FILE"
  fi

  ((i++))
done

git add ideas.md
git commit -m "Add idea $1"
git push origin master
