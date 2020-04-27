#!/bin/bash

#Inputs - workshop repository and variant (branch)
export workshop1="https://github.com/IBM/docker101"
#export branch="master"

rm -rf tempClones
mkdir tempClones

rm -rf workshop/*

workshopName=`basename $workshop1`

git clone $workshop1 tempClones/$workshopName
mv tempClones/$workshopName/workshop workshop/$workshopName

echo "* [${workshopName}](${workshopName}/README.md)" >> workshop/Summary.md
echo "* [${workshopName}](${workshopName}/README.md)" >> workshop/README.md

for lab in `ls -d workshop/docker101/*/`; do
  labName=`basename $lab`
  echo "    * [$lab]($lab/README.md)" >> workshop/Summary.md 
  echo "    * [$lab]($lab/README.md)" >> workshop/README.md
  echo "Lab -> `basename $lab`"
done



