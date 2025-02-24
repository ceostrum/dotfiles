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

# ssh add auth
function sshauthadd()
{
    user=`whoami`
    remote=$1
    cat .ssh/id_rsa.pub | ssh $user@$remote 'cat >> .ssh/authorized_keys'
}

# ag search directory and replace with given keywords
function agr()
{
    if [ "$#" -eq 2 ]; then
        # if 2 args, search and replace on directory contents
        ag -0 -l $1 | xargs -0 sed -ri"" -e "s/$1/$2/g"
    elif [ "$#" -eq 3 ]; then
        # if 3 args, search and replace on the given file
        sed -ri"" -e "s/$1/$2/g" $3
    fi
}

# top filter by input string
function topfilter()
{
    filter=$(pgrep -d',' -f ${1})
    if [ "${filter}X" == "X" ]; then
        top
    else
        top -c -p ${filter}
    fi
}

function unzip_all() {
    if [ -z "$1" ]; then
        echo "You must supply a directory."
        return 1
    elif [ ! -d "$1" ]; then
        echo "$1 is not a valid directory."
        return 1
    fi

    for zip in "$1"/*.zip
    do
        unzip "$zip" -d "$1"
    done
}

function postj() {
    curl -s -H "Content-Type: application/json" -d "@$2" "$1"
}

function postjv() {
    curl -v -H "Content-Type: application/json" -d "@$2" "$1"
}

function putj() {
    curl -s -X PUT -H "Content-Type: application/json" -d "@$2" "$1"
}

function putjv() {
    curl -v -X PUT -H "Content-Type: application/json" -d "@$2" "$1"
}

function del() {
    curl -s -X DELETE "$1"
}

function delv() {
    curl -v -X DELETE "$1"
}

function postf() {
    curl -s -F "file=@$2" "$1"
}

function postfv() {
    curl -v -F "file=@$2" "$1"
}

function getf() {
    curl -s "$1" -o "$2"
}

function getfv() {
    curl -v "$1" -o "$2"
}


function kdtl() {
    docker exec -it kafka kafka-topics.sh --bootstrap-server localhost:9092 --list
}

function kdtc() {
    docker exec -it kafka kafka-topics.sh --bootstrap-server localhost:9092 --create --topic "$1"
}

function kdtd() {
    docker exec -it kafka kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic "$1"
}

function kdtp() {
    docker exec -it kafka kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic "$1"
    docker exec -it kafka kafka-topics.sh --bootstrap-server localhost:9092 --create --topic "$1"
}

function kdp() {
    docker exec -it kafka kafka-console-producer.sh --topic "$1" --bootstrap-server localhost:9092
}

function kdc() {
    docker exec -it kafka  kafka-console-consumer.sh --topic "$1" --from-beginning --bootstrap-server localhost:9092
}

