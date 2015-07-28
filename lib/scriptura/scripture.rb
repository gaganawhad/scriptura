require 'yaml'

module Scriptura
  module Scripture
    HOME_PATH = File.realpath(File.join(File.dirname(__FILE__), '..', '..'))
    METADATA_FILE = File.join(HOME_PATH, 'lib', 'scriptura', 'metadata.yml')

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
      @metadata ||= YAML.load_file(METADATA_FILE)
    end

    def self.find_book_hash attribute, value
      metadata.values.find { |book| book[attribute.to_s] == value }
    end
  end
end
