class ScriptureBook
  def initialize(book_number)
    raise ArgumentError, 'book number should be convertable to integer' unless book_number.respond_to?(:to_i)
    raise 'book number should be within 1-66' unless (1..66).cover?(book_number.to_i)
    @book_hash ||= SCRIPTURE_META.find{|book| book['number'] == book_number.to_i}
  end

  def name
    @book_hash["name"]
  end

  def number_of_chapters
    @book_hash['chapters'].count
  end

  def number
    @book_hash['number']
  end
end
