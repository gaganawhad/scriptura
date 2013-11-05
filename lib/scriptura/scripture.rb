module Scriptura
  module Scripture
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

    def self.books
      old_testament_books + new_testament_books
    end

    def self.book_names
      books.map(&:name)
    end
  end
end
