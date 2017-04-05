# Основной класс игры виселица. Хранит состояние игры и предоставляет функции для
# развития игры (ввод новых букв, подсчет кол-ва ошибок и т. п.).

class Game
  MAX_ERRORS = 7
  attr_reader :letters, :errors, :good_letters, :bad_letters, :status

  def initialize(word)
    @letters = get_letters(word)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = :in_progress # :won, :lost
    @good = false
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS - @errors
  end

  def get_letters(word)
    if (word == nil) || (word == "")
      abort "Ошибка чтения файла со словами"
    end

      word.split("")
  end

  def add_to_good(letters, input_letters)
    if letters.any? { |i| input_letters.include?(i) }
      @good = true  # буква в слове встречается, значит она хорошая

      # если слово содержит и Е и Ё или И и Й одновременно
      if input_letters.count == 2 && (input_letters - letters).empty?
        @good_letters << input_letters[0]
        @good_letters << input_letters[1]
      else
        # если слово содержит любые другие буквы, в том числе не повторяющиеся Е и Ё, И и Й
        @good_letters << input_letters[0]
        # условие когда отгадано все слово
      end
    end
  end

  def any_good?
    @good
  end

  def in_progress?
    @status == :in_progress
  end

  def won?
    @status == :won
  end

  def lost?
    @status ==:lost || @errors >= MAX_ERRORS
  end

  def solved?
    @letters.uniq.size == @good_letters.size
  end

  def repeated?(input_letters)
    (@good_letters.any? { |i| input_letters.include?(i) } ||
      @bad_letters.any? { |i| input_letters.include?(i) } )
  end

  def ask_next_letter
    puts "Введите следующую букву \n"
    input_letters = []

    # ждем пока пользователь не введет хоть что-то
    while input_letters.count == 0 do
      input = STDIN.gets.chomp
      input_letters << Unicode::downcase(input)
    end

    # Проверки на е/ё, и/й. если пользователь ввел одну из них, парная тоже будет проверяться
    case input_letters[0]
      when 'й' then input_letters << 'и'
      when 'и' then input_letters << 'й'
      when 'е' then input_letters << 'ё'
      when 'ё' then input_letters << 'е'
    end
    check_result(input_letters)
  end

  def check_result(input_letters)
    # счетчик ввел ли пользователь хорошую букву или нет
    @good = false

    # если такие буквы уже вводились - выходим из метода
    return if repeated?(input_letters)

    # если введенные буквы есть в слове, добавляем в good_letters
    add_to_good(@letters, input_letters)

    @status = :won if solved?

    # если была введена плохая буква, увеличиваем количество ошибок и добавляем в bad_letters
    if !any_good?
      @bad_letters << input_letters[0]
      @errors += 1
      @status = :lost if lost?
    end
  end
end
