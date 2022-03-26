#!/bin/bash

engine="$(echo -e "Google\narXiv\nWiki\nScihub\nGithub" | dmenu -p "Which Engine?" -l 20 -i)"

if [ -z "$engine" ]
then
    exit 0
fi

text="$(echo -e " " | dmenu -p "What you want to know?" -i)"

if [ -z "$text" ]
then
    exit 0
fi

case "$engine" in
    Google)
	qutebrowser https://www.google.com/search?q="$text" ;;
    arXiv)
	type="$(echo -e "title\nauthor\nabstract\ncomments" | dmenu -p "Type:" -i -l 10)"
	if  [ -z "type" ]
	then
	    type="all"
	fi
	result="https://arxiv.org/search/?query=$text&searchtype=$type&abstracts=show&order=-announced_date_first&size=50"
        qutebrowser $result ;;
    Wiki)
	qutebrowser https://en.wikipedia.org/wiki/"$text" ;;
    Scihub)
	qutebrowser https://sci-hub.tw/"$text" ;;
    Github)
	qutebrowser https://github.com/search/?q="$text" ;;
esac

    
