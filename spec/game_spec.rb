require "rspec"
require "game"
require "result_printer"
require "word"

describe Game do

  it 'user wins the game' do
    # Загадываем слово
    game = Game.new('верёвка')

    # Убедимся, что в начале игры статус — игра в процессе
    expect(game.status).to eq :in_progress

    # Удачно отгадаем несколько букв, симулируя действия игрока

    # !!!по факту я пропускаю метод ask_next_letter и очень долго обращаюсь к массиву. должен быть другой способ
    input_letters = ['в']
    game.check_result(input_letters)
    input_letters = ['е', 'ё']
    game.check_result(input_letters)
    input_letters = ['р']
    game.check_result(input_letters)
    input_letters = ['к']
    game.check_result(input_letters)
    input_letters = ['а']
    game.check_result(input_letters)

    # Теперь изучем состояние экземпляра game: количество ошибок и статус
    expect(game.errors).to eq 0
    expect(game.status).to eq :won

  end

  it 'user loses the game ' do

    # Загадываем слово
    game = Game.new('карма')

    # Симулируем действия игрока, но не угадываем буквы
    input_letters = ['в']
    game.check_result(input_letters)
    input_letters = ['е', 'ё']
    game.check_result(input_letters)
    input_letters = ['х']
    game.check_result(input_letters)
    input_letters = ['т']
    game.check_result(input_letters)
    input_letters = ['ж']
    game.check_result(input_letters)
    input_letters = ['г']
    game.check_result(input_letters)
    input_letters = ['ъ']
    game.check_result(input_letters)

    # Теперь изучем состояние экземпляра game: количество ошибок и статус
    expect(game.errors).to eq 7
    expect(game.status).to eq :lost

  end
end
