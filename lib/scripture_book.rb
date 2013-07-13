class ScriptureBook
  def initialize(book_number)
    @book_hash ||= SCRIPTURE_META.find{|book| book['number'] == book_number}
  end

  def name
    @book_hash["name"]
  end
end
