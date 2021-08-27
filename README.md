## Goal: create an audiobook from a well formatted txt file with Mozilla Text to Speech.

This bash script converts a text file.txt into a file.wav. Right now these languages are allowed: English (en), Spanish (es), French (fr) and Japanese (ja). This script is not a translator, so each file.txt must correspond to the respective language. The script converts each line in the file.txt into a file.wav, that is why it is strongly important that every line is well formatted. Again, make sure every line is perfect in the file.txt; you do not want the script stops at 99% (or in the middle) because a line has a bad character, time is precious and should not be wasted.

## Requirements:

1. Mozilla Text to Speech: https://github.com/mozilla/TTS

2. Well formatted txt file must be:
   1. No single character alone is allowed, (’) this apostrophe is doing nothing
   2. Any simbol that is alone will stop the script, remove them if they are doing nothing
   3. Verify that each open symbol has it's close. Examples open but not closed: (,[,{,",',’,-,_,.
   4. Only a txt extension is allowed, rename your file as "fileName.txt"

3. A ffmpeg version (to merge audios): https://ffmpeg.org/

## [How to merge audios?](MergeAudios.md)


## Extra: to avoid problems with your python environment, create a virtualenv to install Mozilla tts there.

https://docs.python.org/3/tutorial/venv.html


Create a Python virtual environment (virtualenv), if you have python and pip installed already.

1. $ python3 -m venv ~/ttsenv

2. $ source ~/ttsenv/bin/activate

3. (ttsenv) $ python -m pip install --upgrade pip

4. (ttsenv) $ pip install TTS


Or Install python with miniconda if you do not have it

https://conda.io/projects/conda/en/latest/user-guide/install/linux.html


## RUN THE SCRITP

1. Download this git project (folders are required to have everything pretty)

2. Add the execute action to the script

   $ chmod -v +x CreateAudios.sh

3. Run the script

   $./CreateAudios.sh

4. Write the letters correspondig to the language you want to convert into

   $ en

5. Write the name of your book.txt you want to convert into a book.wav (Obviously you have to save 'AliceinwonderlandEnglish.txt' book first in ~/CreateAudios/txtfiles)

   $ AliceinwonderlandEnglish.txt

6. If your book.txt is well formatted, just wait and you will have a book.wav. Otherwise, the script will stop if a bad character is found.


## Help!

This script use an Artificial Intelligence (AI) application (Mozilla tts), so the audio voice generated it is kind of robotic. My native language is Spanish and I understand a little bit English; if your native language is one of the above (or need another one), please help us. I will add my favorite book (Alice’s Adventures in Wonderland) to each language and here you can verify if the text is correct. If you love AI and Mozilla tts, please help them to have the best tts in the world.

My soul is full if I'm learning something new. If you are like me, please share your knowledge!
