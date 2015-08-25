#!/bin/bash

#  (?<=\[.+\]\()[a-zA-Z]{3,}://[a-zA-Z0-9\.]+/*[a-zA-Z0-9/\\%_.\-]*[:0-9]*\?*[a-zA-Z0-9/\\%_.=&amp;]*
markdownlinks="\[.*\]\(.*\)"
# original # linkregex="[a-zA-Z]{3,}://[a-zA-Z0-9\.]+/*[a-zA-Z0-9/\\%_.\-]*[:0-9]*\?*[a-zA-Z0-9/\\%_.=&amp;]*"

# the following uses the Perl compatibiliy engine to exclude using the \K switch 
# as a workaround for positive lookbehind variability issue
# http://stackoverflow.com/questions/10958447/perl-regex-quantification-error-precced
linkregex="\[.+\]\(\K[a-zA-Z]{3,}://[a-zA-Z0-9\.]+/*[a-zA-Z0-9/\\%_.\-]*[:0-9]*\?*[a-zA-Z0-9/\\%_.=&amp;]*"
foundlinks=$(grep -P -o -i "$linkregex" $1 | sort | uniq -u)
echo "$foundlinks"
# echo "all links: $(egrep -o '$markdownlinks' $1 | sort | uniq -u)