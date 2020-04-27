#!/bin/bash

rm -rf tempClones
mkdir tempClones
rm -rf workshop/*

for repo in `cat agenda.txt`
do
        echo "adding ${repo} to agenda"


	workshopName=`basename $repo`

	git clone $repo tempClones/$workshopName
	mv tempClones/$workshopName/workshop workshop/$workshopName

	echo "* [${workshopName}](${workshopName}/README.md)" >> workshop/Summary.md
	echo "* [${workshopName}](${workshopName}/README.md)" >> workshop/README.md

	for lab in `ls -d workshop/$workshopName/*/`; do
		labName=`basename $lab`
		echo "    * [$workshopName/$labName]($workshopName/$labName/README.md)" >> workshop/Summary.md 
		echo "    * [$workshopName/$labName]($workshopName/$labName/README.md)" >> workshop/README.md
		echo "Lab -> `basename $lab`"
	done

done



