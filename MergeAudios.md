## How to merge two or more audios in one file?

If your script ("CreateAudios.sh") ran successfully you have a lot of wav files in a folder (named with the name of your book "AliceinwonderlandEnglish") and now those wav files need to be merged.

1. Change directory (cd) to the wav files

   $ cd ~/CreateAudios/audios/en/AliceinwonderlandEnglish

2. Create a temporal variable to list in order the wav files

   $ wavlist=`find *.wav | sort -n`

3. Prepare a txt file with the wav files needed by ffmpeg to merge them to a single audio

   $ while read line; do echo "file "${line}; done <<< "$wavlist" > wavlist.txt

4. Run ffmpeg to merge the wav files into a single one

   $ ffmpeg -f concat -safe 0 -i wavlist.txt -c copy AliceinwonderlandEnglish.wav

5. Optional (Remove unnecessary wav files)

   $ rm -f !(AliceinwonderlandEnglish.wav|wavlist.txt)
