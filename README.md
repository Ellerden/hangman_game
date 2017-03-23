Welcome to the emulator of the famous word game "The hangman".

It picks a random word from the file "words.txt".
If you're not familiar with it or want to know more than you already know, take a look here: https://en.wikipedia.org/wiki/Hangman_(game)

##Getting started

1 This program was made on Ruby, make sure you have Ruby on your computer to start the game.
2 In order to work properly with Russian language install addional unicode normalisation gem (https://github.com/blackwinter/unicode). Do this command in your terminal:
   gem install unicode
3 To play download all the files and launch main.rb.

##How to play

Remember, a man's life is hanging in your handshands.

1 You'll see a row of dashes - each dash represents each letter.
2 Type a letter that you think is in the word (in Russian)
3 If you're correct the letter will appear in a correct position.
4 If you're wrong - you've just put a man closer to death. One element will be added to the hangman's body.
5 You have 7 guesses/chances to save or kill the man.

##How to add words

1 Computer picks a random word from the file "words.txt"
2 Find this file in "data/words.txt" and add all the words you want in English or Russian.
