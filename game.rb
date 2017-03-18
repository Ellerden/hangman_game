class Game
  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(slovo)
    if (slovo == nil) || (slovo == "")
      abort "Ошибка чтения файла со словами"
    end
      slovo.split("")
  end

  def ask_next_letter
    puts "Введите следующую букву \n"
    input_letters = []

    while input_letters.count == 0 do
      input = STDIN.gets.chomp
      input_letters << Unicode::downcase(input)
    end
    # Проверки на е/ё, и/й. если пользователь ввел одну из них, парная тоже будет проверяться
    if input_letters[0] == "й"
      input_letters << "и"
    elsif input_letters[0] == "и"
      input_letters << "й"
    elsif input_letters[0] == "е"
      input_letters << "ё"
    elsif input_letters[0] == "ё"
      input_letters << "е"
    end

    check_result(input_letters)
  end

  def check_result(input_letters)
    if @status == -1 || @status == 1
      return
    end

    if (@good_letters.any? { |i| input_letters.include?(i) } ||
      @bad_letters.any? { |i| input_letters.include?(i) } )
    return
    end

    if @letters.any? { |i| input_letters.include?(i) }
      # если слово содержит и Е и Ё или И и Й одновременно
      if input_letters.count == 2 && (input_letters - @letters).empty?
      @good_letters << input_letters[0]
      @good_letters << input_letters[1]
      else
      # если слово содержит любые другие буквы, в том числе не повторяющиеся Е и Ё, И и Й
      @good_letters << input_letters[0]
      # условие когда отгадано все слово
      end

      if @letters.uniq.size == @good_letters.size
          @status = 1
      end
    else
      @bad_letters << input_letters[0]
      @errors += 1
      if @errors >= 7
        @status = -1
      end
    end
  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def status
    @status
  end

  def errors
    @errors
  end
end
