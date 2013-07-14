class ScriptureVerse
  def initialize book_number, chapter_number, verse_number
    @scripture_chapter = ScriptureChapter.new(book_number, chapter_number)
    raise ArgumentError, 'verse number cannot be converted to an integer' unless verse_number.respond_to?(:to_i)
    raise 'verse number does not exist' if (1..@scripture_chapter.number_of_verses).cover? verse_number.to_i
    @verse_number = verse_number if verse_number.to_i
  end
end
