require_relative "result_printer"
require_relative "game"
require_relative "word"
require "unicode"
puts "Игра виселица версия 3.0!"
current_path = File.dirname(__FILE__)

printer = ResultPrinter.new
slovo = Word.new
slovo_file_name = current_path + "/data/words.txt"
game = Game.new(slovo.read_from_file(slovo_file_name))

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end
printer.print_status(game)