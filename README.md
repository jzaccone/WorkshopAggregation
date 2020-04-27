# Workshop Aggregation Script
Use the `aggregateWorkshop.sh` script in this repo to combine multiple gitbooks on IBM Developer gitbook account into a single gitbook.

# Steps
1) Fork this repo. Rename the repo to the name of your new aggregate workshop. This project provides the template and script to populate the content for your new workshop

2) Gather the names of the gitbooks an variants that you would like to include in your aggregate. 
TODO put input in input.txt 
TODO use MattsScript.sh as an agenda builder
TODO pull list of workshop options via gitbook API

3) Create a new space on gitbook 
TODO automate using gitbook CLI

4) Manually inspect and edit 

Gitbook 
* <https://ibm-developer.gitbook.io/>.

This repository has the following structure:
```ini
|_ .gitbook (images)
|_ <language> (localization support) 
|_ README.md (gitbook home page)
|_ SUMMARY.md (table of contents)

|_ docker 101 
  |_ README.md
  |_ lab N (workshop labs)
    |_ README.md
|_ kubernetes 101 
  |_ README.md
  |_ lab N (workshop labs)
    |_ README.md
```

## Markdown lint tool

Install the [Markdown lint tool](https://github.com/markdownlint/markdownlint),
```
$ npm install -g markdownlint-cli
```

To use markdownlint, run the following command,
```
$ markdownlint workshop -c ".markdownlint.json" -o mdl-results.md
```

## Build Gitbook 

Install the [gitbook-cli](https://github.com/GitbookIO/gitbook-cli),
```
$ npm install -g gitbook-cli
```

To build the Gitbook files into the `_book` sub-directory with the `gitbook-cli`, run the following command,
```
$ gitbook build ./workshop
```

Serve the Gitbook files locally with the following command,
```
$ gitbook serve ./workshop
```



