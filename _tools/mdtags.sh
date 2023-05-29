#!/bin/zsh

# mdtags.sh
# ---------
#
# generate tags from markdown notes
# read the tags: line from the yaml header
# convert the result to ctags format
# insert the tag lines into the tags file in $dir


dir=$1
tagsfile="$dir/tags"

# change into notes directory
cd $dir

# if a tagsfile exists, delete it
if [ -f $tagsfile ]; then
    rm $tagsfile
fi

# run universal ctags to generate a new tags file
#$ctags -R .

# ripgrep the tags from the markdown files into $result
result=$(rg --no-heading --no-column '(^tags:)' -g '*.md')
# process the $result
while IFS= read -r lines ; do
    for line in $lines; do
        file=$(echo $line| cut -d ":" -f1)
        tags=$(echo $line | cut -d " " -f4-)
        for tag in $(echo $line| cut -d " " -f2-); do
            echo "$tag\t$file\t/^tags: $tags$/;\"\tt" >> "$tagsfile"
        done
    done
done <<< "$result"

