# файл печатает виселицу на экран, выводит результат игры
class ResultPrinter

  def initialize(game)
    @status_image = []
    current_path = File.dirname(__FILE__)
    i = 0

    while i <= game.max_errors
      file_name = current_path + "/../image/#{i}.txt"

      if File.exist?(file_name)
        file = File.new(file_name, "r:UTF-8")
        @status_image << file.read
        file.close
      else
        @status_image << "\n [ изображение не найдено ] \n"
      end

      i += 1
    end
  end

  def print_status(game)
    clear_screen

    puts "\nСлово: " + word_for_print(game.letters, game.good_letters)
    puts "Ошибки - #{game.errors}: #{game.bad_letters.join(", ")}"
    print_hanger(game.errors)

    if game.errors >= game.max_errors
      puts "Вы проиграли!"
    else
      if game.letters.uniq.size == game.good_letters.size
        puts "Поздравляю, вы выиграли!"
      else
        puts "Угадывайте! Количество оставшихся попыток: #{game.errors_left}"
      end
    end
  end


  def word_for_print(letters, good_letters)
    result = ""
    for i in letters do

      if good_letters.include?(i)
        result << i + " "
      elsif good_letters.include?("ё") && i =="е"
        result << i + " "
      elsif good_letters.include?("е") && i =="ё"
        result << i + " "
      elsif good_letters.include?("и") && i =="й"
        result << i + " "
      elsif good_letters.include?("й") && i =="и"
        result << i + " "
      else
        result << "_" + " "
      end
    end
    result
  end

  def clear_screen
    system "clear" or system "cls"
  end

  def print_hanger (errors)
    puts @status_image[errors]
  end
end