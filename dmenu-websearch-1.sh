#!/bin/bash
exit_justify () {
if [ -z "$1" ]
then
    exit 0
fi
}

#web="$(echo -e "qutebrowser\nchromium" | dmenu -p "Which Browser?" -l 20 -i)"

web="qutebrowser"

engine="$(echo -e "Google\nDuckDuckgo\narXiv\nWiki\nSci-Hub\nMath-Overflow\nStack-Overflow\nGithub\nNyaa\nBilibili\nBangumi\nUrl\nCNU" | dmenu -p "Which Engine?" -l 20 -i)"

exit_justify "$engine"


case "$engine" in

    Google)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
        exit_justify "$txt"
 	text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
	$web https://www.google.com/search?q=$text ;;

    DuckDuckgo)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
        exit_justify "$txt"
 	text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
	$web https://duckduckgo.com/?q=$text&ia=web ;;

    arXiv)
	do="$(echo -e "Search\nList" | dmenu -p "What do you want to do?" -i -l 3)"
	case "$do" in
	    Search)
         	type="$(echo -e "all\ntitle\nauthor\nabstract\ncomments" | dmenu -p "Type:" -i -l 10)"
                txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"
		exit_justify "$txt"
		if [ $type == "author" ]
		then
                    where="$(echo -e "Chinese\nOthers" | dmenu -p "Where:" -i -l 3)"
                    if [ $where == Chinese ]
		    then
		    text="$(echo -e $txt | sed -r 's/[[:space:]]+/,/g' )"
		    else
		    text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
		    fi
	        else
		    text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
		fi
	        result="https://arxiv.org/search/?query=$text&searchtype=$type&abstracts=show&order=-announced_date_first&size=50"
                $web $result ;;
	    List)
		type="$(echo -e "math.DG\nmath.MG" | dmenu -p "Field:" -i -l 4)"
		result="https://arxiv.org/list/$type/recent"
		$web $result ;;
	esac ;;
	
    Wiki)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
        exit_justify "$txt"
        $web https://en.wikipedia.org/wiki/"$txt" ;;

    Sci-Hub)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
        exit_justify "$txt"
	text="$(echo -e $txt | sed -r 's/[[:space:]]+/,/g' )"
        $web https://sci-hub.se/"$text" ;;

    Github)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
	exit_justify "$txt"
	text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
	$web https://github.com/search/?q=$text ;;

    Stack-Overflow)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
        exit_justify "$txt"
	text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
        $web https://stackoverflow.com/search?q=$text ;;

    Math-Overflow)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
        exit_justify "$txt"
 	text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
	$web https://mathoverflow.com/search?q=$text ;;

    Nyaa)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
        exit_justify "$txt"
 	text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
	$web https://nyaa.si/?f=0&c=0_0&q="$text" ;;
    
    Bilibili)
	txt="$(echo -e " " | dmenu -p "What you want to know?" -i)"         		
        exit_justify "$txt"
 	text="$(echo -e $txt | sed -r 's/[[:space:]]+/+/g' )"
	$web https://search.bilibili.com/all?keyword=$text ;;

    Bangumi)
	time="$(echo -e " " | dmenu -p "Date:" -i)"
	sort="$(echo -e "rank\ndate\ntitle" | dmenu -p "Sort:" -i -l 3)"
	result="https://bangumi.tv/anime/browser/airtime/$time?sort=$sort"
	$web $result ;;
    Url)
        txt="$(echo -e "" | dmenu -p "What do you want to go?" -i)"         		
	$web https://$txt ;;
    CNU)
	$web 192.168.1.91 ;;
esac

exit 0
