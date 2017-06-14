# Hangman
Welcome to the emulator of the famous word game "The hangman".<br />

It picks a random word from the file "words.txt".<br />
If you're not familiar with it or want to know more than you already know, take a look here: https://en.wikipedia.org/wiki/Hangman_(game)<br />

## Getting started<br />

1 This program was made on Ruby, make sure you have Ruby on your computer to start the game.<br />
2 In order to work properly with Russian language install addional unicode normalisation gem (https://github.com/blackwinter/unicode). Do this command in your terminal:<br />
<code>   gem install unicode</code><br />
3 To play download all the files and launch main.rb.<br />
<code>ruby main.rb</code>

## How to play<br />

Remember, a man's life is hanging in your handshands.<br />

1 You'll see a row of dashes - each dash represents each letter.<br />
2 Type a letter that you think is in the word (in Russian).<br />
3 If you're correct the letter will appear in a correct position.<br />
4 If you're wrong - you've just put a man closer to death. One element will be added to the hangman's body.<br />
5 You have 7 guesses/chances to save or kill the man.<br />

## How to add words<br />

1 Computer picks a random word from the file "words.txt".<br />
2 Find this file in "data/words.txt" and add all the words you want in English or Russian.<br />
