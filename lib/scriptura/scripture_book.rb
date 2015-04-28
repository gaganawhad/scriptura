require 'scriptura/scripture'

module Scriptura
  class ScriptureBook
    def initialize(number)
      fail ArgumentError, 'book number cannot be converted to an integer' unless number.respond_to?(:to_i)
      fail DoesNotExist, 'Book number should be within 1-66' unless (1..66).cover?(number.to_i)
      @number = number.to_i
    end

    def self.find_by_name(name)
      hash = Scripture.metadata.values.find { |book| book['name'] == name }
      fail "Book by the name #{name} was not found! Check if there was a spelling error.. or try initializing it with a book number" if hash.nil?
      new(hash['number'])
    end

    def self.find(string_id)
      hash = Scripture.metadata.values.find { |book| book['string_id'] == string_id }
      fail "Book by the string_id #{string_id} was not found! Check if there was a spelling error.. or try initializing it with a book number" if hash.nil?
      new(hash['number'])
    end

    def name
      book_hash['name']
    end

    def abbr_name
      book_hash['abbr']
    end

    def number_of_chapters
      book_hash['chapters'].count
    end

    def number
      book_hash['number']
    end

    def first_chapter
      @first_chapter ||= ScriptureChapter.new(number, 1)
    end

    def last_chapter
      @last_chapter ||= ScriptureChapter.new(number, number_of_chapters)
    end

    def first_chapter_number
      first_chapter.number
    end

    def last_chapter_number
      last_chapter.number
    end

    def to_hash
      book_hash
    end

    def string_id
      book_hash['string_id']
    end

    private

    def book_hash
      @book_hash ||= Scripture.metadata[@number.to_i]
    end

    class DoesNotExist < StandardError; end;
  end
end
