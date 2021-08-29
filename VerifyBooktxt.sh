#!/bin/bash
# Exit properly if something goes wrong
set -e 
set -o pipefail

# Verify line by line each book.txt
# to ensure that the text will be
# well formatted, if it is not
# then just modify the respective
# line in the original book.txt

parentPath=`pwd`

echo -n "Write the two letters of a language (English (en), Spanish (es), French (fr), Japanese (ja)): "
read LANGUAGE
echo "You wrote: $LANGUAGE"

echo "Write your file's name exactly as you saved it including the .txt extension: "
read fileName

# Remove the filename spaces
fileName2=`echo "$fileName" | sed 's/ //g'`
echo "File name without spaces: $fileName2"
# Remove the filename extension txt
fileNamenotxt="${fileName2/.txt/}"
echo "File renamed: $fileNamenotxt"

if [ "$LANGUAGE" == "en" ]; then
     echo "Your language is: English"
elif [ "$LANGUAGE" == "es" ]; then
     echo "Your language is: Spanish"
elif [ "$LANGUAGE" == "fr" ]; then
     echo "Your language is: French"
elif [ "$LANGUAGE" == "ja" ]; then
     echo "Your language is: Japanese"
else
     echo "Your language is invalid: "$LANGUAGE""
     LANGUAGE="unknow"
     # failure, wrong parameter entered
     exit 1
fi

# Read the file content
echo "Original name: $fileName"
echo "Current path: $parentPath"

fileExist="$parentPath"/txtfiles/"$LANGUAGE"/"$fileName"

# Check if file is empty or doesn't exist
if [ ! -s "$fileExist" ] || [ ! -f "$fileExist" ]; then
     echo "Your file is empty or doesn't exist: "$fileExist""
     # failure, file empty or doesn't exist
     exit 2
else
     # Read the file's content and remove blank lines
     fileContent=$(grep '[^[:blank:]]' <"$parentPath"/txtfiles/"$LANGUAGE"/"$fileName")
     echo "Your file has something: $fileContent"
     # Create a folder to save txt files
     mkdir -vp $parentPath/txtfiles/"$LANGUAGE"/"$fileNamenotxt"
     # Begin while
     n=1
     while read line; do
     # Print each line from the book.txt into a txt file       
        echo "$line" > "$parentPath"/txtfiles/"$LANGUAGE"/"$fileNamenotxt"/"$n""$fileName2"
        n=$((n+1))
     done <<< "$fileContent"
     echo "Your book.txt has: $(($n-1)) lines."
     # End while
fi
echo "This script stopped in exit: $?"
# exit with success
exit 0
