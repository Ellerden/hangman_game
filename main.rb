require_relative "lib/result_printer"
require_relative "lib/game"
require_relative "lib/word"
require "unicode"
puts "Игра виселица версия 4.0!"
current_path = File.dirname(__FILE__)

word = Word.new
word_file_name = current_path + "/data/words.txt"
game = Game.new(word.read_from_file(word_file_name))
printer = ResultPrinter.new(game)

while game.in_progress? do
  printer.print_status(game)
  game.ask_next_letter
end
printer.print_status(game)