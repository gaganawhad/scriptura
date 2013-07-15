class ScriptureChapter
  attr_accessor :scripture_book

  def initialize book_number, chapter_number
    @scripture_book = ScriptureBook.new(book_number)
    raise ArgumentError, 'chapter number cannot be converted to an integer' unless chapter_number.respond_to?(:to_i)
    raise 'book number should be within 1-66' unless (1..66).cover?(book_number.to_i)
    @chapter_hash = @scripture_book.to_hash['chapters'].find{|chapter| chapter['number'] == chapter_number.to_i}
    raise 'chapter does not exist' if @chapter_hash.nil?
  end

  def number
    @chapter_hash['number']
  end

  def number_of_verses
    @chapter_hash['verses']
  end

  def first_verse
    @first_verse = ScriptureVerse.new(scripture_book.number, self.number, 1)
  end

  def last_verse
    @first_verse = ScriptureVerse.new(scripture_book.number, self.number, self.number_of_verses)
  end

  def first_verse_number
    first_verse.number
  end

  def last_verse_number
    last_verse.number
  end
end

