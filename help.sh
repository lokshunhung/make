#!/usr/bin/env bash

# https://gist.github.com/klmr/575726c7e05d8780505a?permalink_comment_id=5676387#gistcomment-5676387

# $1 makefile list
# $2 verbose flag
# $3 target argument

awk \
-v c0=$(tput sgr0) \
-v c1=$(tput setaf 2) \
-v c2=$(tput setaf 6) \
-v vf=$2 \
-v ta=$3 \
'
/^## / {
    sub(/^## +/, "    ")
    h = h "\n" $0
    next
}
/^### / {
    sub(/^### +/, "      ")
    if (vf=="-v") { h = h "\n" $0 }
    next
}
/^([^\t].*):/ {
    if (h=="") next
    sub(/:.*/, "")
    if (ta!="" && ta!=$0) next
    print "- " c2 $0 c0 h
}
{
    h = ""
}
' \
$1
