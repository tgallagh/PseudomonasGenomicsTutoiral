#!/usr/bin/env bash
#shebang line
#env path to executable file --- scripting interpretor location
#! tells the script that this is a script

###test if user has given both a name and a path
if [ ! $# == 2 ]
# $# variable is the number of command line arguments. This script takes exactly 2 arguments
#if 2 variables, then do something and end
then
    scriptname=`basename "$0"`

# $0 is the full path to the script, basename takes just the filename part
#$ for scalar... bash's way of tagging a variable.
#back kicks `` run name to give me the contents of dollar sign 0. this is how bash passes information

    echo "usage: $0 name path"
# Print usage if the number of arguments isn't correct.

exit 1
# Exit. If it doesn't have two arguments, then exit.
fi #reverse of if


#processing the argument
name=$1 # $1 is first argument
path=$2 # $2 is second argument

mkdir -p $path/$name/code/{analysis,scripts,src}
# -p makes parental. create all necessary parental directories until you get to directory
# Curly brackets are similar to globs, except they can fail
# curly brackets are also more flexible in that they can take ranges
mkdir -p $path/$name/data/{raw,processed}
mkdir -p $path/$name/output/{reports,tables,figures}

find $path/$name -type d -exec touch {}/README.md \;
# Using the find program with the exec option
# d  = directory
# touch creates a file
# {} subsittution place holder --- whatever you find, loop over it and for each element, substitute here. every single directory put an empty README file in it
#we used .md so that we can format it prettily later

echo -e "Project $name created at $path.\n"
# the -e lets echo use escape characters

tree $path/$name
#tree prints out a directory tree of the specified path

#when in doubt use man
