require 'yaml'

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

    def self.metadata
      @metadata ||= begin
        YAML.load_file('lib/scriptura/metadata.yml')
      end
    end

    def self.find_book_hash attribute, value
      metadata.values.find { |book| book[attribute.to_s] == value }
    end
  end
end
