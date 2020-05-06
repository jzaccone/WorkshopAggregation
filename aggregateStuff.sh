#!/bin/bash

rm -rf tempClones
mkdir tempClones
rm -rf workshop/generatedContent/*
rm -rf workshop/generatedContentLinks.md

for repo in `cat agenda.txt`
do
        echo "adding ${repo} to agenda"


	workshopName=`basename $repo`

	git clone $repo tempClones/$workshopName
	mv tempClones/$workshopName/workshop workshop/generatedContent/$workshopName

	echo "* [${workshopName}](${workshopName}/README.md)" >> workshop/generatedContentLinks.md

	for lab in `ls -d workshop/generatedContent/$workshopName/*/`; do
		labName=`basename $lab`
		echo "    * [$workshopName/$labName]($workshopName/$labName/README.md)" >> workshop/generatedContentLinks.md 
		echo "Lab -> `basename $lab`"
	done

	echo "This content is generated! Do not edit directly! Please run aggregateStuff.sh to repopulate with latest content from agenda.txt!" > workshop.generatedContentLinks.md
done



