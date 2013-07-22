module ScriptureMeta
  def self.old_testament_books
    books = []
    (1..39).each do |book_number|
      books << ScriptureBook.new(book_number)
    end
    books
  end

  def self.new_testament_books
    books = []
    (40..66).each do |book_number|
      books << ScriptureBook.new(book_number)
    end
    books
  end
end
