# Workshop Aggregation Script
Use the `aggregateWorkshop.sh` script in this repo to combine multiple gitbooks on IBM Developer gitbook account into a single gitbook.

# About
This repo is two things
1) It contains a template that is the contains all the files you need for a gitbook
2) It contains a script `aggregateStuff.sh` that 
  a) Reference other repos listed in `agenda.md` and pull them into a generated folder `workshop/generatedContent`
  b) Create a list of generated content links at the `workshop/generatedContentLinks.md` level which can be copied into the main part of the workshop

# Steps - Create New Aggregate
1) Fork the repo. Rename the repo to the name of your new aggregate workshop. This project provides the template and script to populate the content for your new workshop

2) Gather the links to the repos you want to pull in gitbooks into `agenda.txt`
TODO add support for variants

3) Create a new space on gitbook: https://ibm-developer.gitbook.io/
TODO automate using gitbook CLI

4) Manually edit `workshop/README.md` and `workshop/Summary.md` and other workshop files as needed to customize experience for this end-to-end workshop. 

# Steps - Populate Aggregate (first time or update)

This will wipe out everything in the `generatedContent` folder and repopulate based on links in `agenda.txt`. It won't touch any other files in the workshop folder.

```sh
./aggregateStuff.sh
```

The standard gitbook structure is so:
```ini
.gitbook.yaml (tells GitBook to only read the stuff in 'workshop')
.travis.yaml (runs markdownlint by default)
README.md (only used for GitHub.com)
- data (any data (CSV, JSON, etc files) to be used)
- notebooks (any Jupyter notebooks can go here)
- src (any application source code can go here)
- workshop (this is where the workshop is documented)
|_ .gitbook (images should go here)
|_ <folder-n> (these are exercises for the workshop that you manually add)
  |_README.md (the steps for the exercise, in Markdown)
|_ README.md (this will appear on the gitbook home page)
|_ SUMMARY.md (this dictates the Table of Contents)
```

In additional to those files, the script adds to the `workshop` folder:
|_ generatedContent (generated content DO NOT EDIT)
  |_<folder-n> (these are exercises for the workshop that are added by the script)
|_ generatedLinks.md
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



