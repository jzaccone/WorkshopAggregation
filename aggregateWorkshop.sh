#!/bin/bash

rm -rf tempClones
mkdir tempClones
rm -rf workshop/generatedContent/*
rm -rf workshop/generatedContentLinks.md

grep -v '^ *#' < agenda.txt | while IFS= read -r repo
do
    echo "adding $repo to agenda"
    workshopName=$(basename "$repo")
	git clone "$repo" tempClones/"$workshopName"
	cp -a tempClones/"$workshopName"/workshop workshop/generatedContent/"$workshopName"
	echo "* [generatedContent/$workshopName](generatedContent/$workshopName/README.md)" >> workshop/generatedContentLinks.md
	for lab in workshop/generatedContent/"$workshopName"/*/*; do
        [[ -d "$lab" ]] || break
		labName=$(basename "$lab")
		echo "    * [generatedContent/$workshopName/$labName](generatedContent/$workshopName/$labName/README.md)" >> workshop/generatedContentLinks.md
		echo "Lab -> $(basename "$lab")"
	done
	echo "This content is generated! Do not edit directly! Please run aggregateStuff.sh to repopulate with latest content from agenda.txt!" > workshop/generatedContent/README.md
done
