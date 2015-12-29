#!/bin/bash

# Compare original and gzipped file size
gz()
{
    local origsize=$(wc -c < "$1")
    local gzipsize=$(gzip -c "$1" | wc -c)
    local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l)

    printf "orig: %d bytes\n" "$origsize"
    printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio"
}

# Compare original and tar / gzipped file size
tgz()
{
    local tarsize=$(gunzip -c "$1" | wc -c)
    local gzsize=$(wc -c "$1" | awk -F" " '{print $1}')
    local ratio=$(echo "$gzsize * 100 / $tarsize" | bc -l)

    printf "tar: %d bytes\n" "$tarsize"
    printf "gzip: %d bytes (%2.2f%%)\n" "$gzsize" "$ratio"
}

# Extract archives
extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) rar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) printf "'$1' cannot be extracted via extract()\n" ;;
        esac
    else
        printf "'$1' is not a valid file\n"
    fi
}

# Determine size of a file or total size of a directory
function fs()
{
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* *;
	fi;
}

# Determine the number of files
function fc()
{
    echo $1
    #ll $1 | wc
}

# SVN File History
function shist()
{
    url=$1 # current url of file
    svn log -q $url | grep -E -e "^r[[:digit:]]+" -o | cut -c2- | sort -n |
    {
        # first revision as full text
        echo
        read r
        svn log -r$r $url@HEAD
        svn cat -r$r $url@HEAD
        echo

        # remaining revisions as differences to previous revision
        while read r
        do
            echo
            svn log -r$r $url@HEAD
            svn diff --internal-diff -c$r $url@HEAD
            echo
        done
    }
}