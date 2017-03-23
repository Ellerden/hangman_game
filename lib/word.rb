# метод выбирает случайное слово для загадывания из файла со словами
class Word
  def read_from_file(file_name)
    return nil if !File.exist?(file_name)
    file = File.new(file_name, "r:UTF-8")
    lines = file.readlines
    file.close
    Unicode::downcase(lines.sample.chomp)
  end
end