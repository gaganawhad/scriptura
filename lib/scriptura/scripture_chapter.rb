require 'scriptura/scripture_book'

module Scriptura
  class ScriptureChapter
    attr_reader :scripture_book
    attr_reader :chapter_number
    alias_method :number, :chapter_number

    def initialize(book_number, chapter_number)
      @scripture_book = ScriptureBook.new(book_number)
      fail ArgumentError, 'chapter number cannot be converted to an integer' unless chapter_number.respond_to?(:to_i)
      fail 'book number should be within 1-66' unless (1..66).cover?(book_number.to_i)
      @chapter_number = chapter_number.to_i
      fail DoesNotExist, 'chapter does not exist' if chapter_hash.nil?
    end

    def number_of_verses
      chapter_hash['verses']
    end

    def first_verse
      @first_verse = ScriptureVerse.new(scripture_book.number, number, 1)
    end

    def last_verse
      @first_verse = ScriptureVerse.new(scripture_book.number, number, number_of_verses)
    end

    def first_verse_number
      first_verse.number
    end

    def last_verse_number
      last_verse.number
    end

    def to_s
      "#{scripture_book} #{@chapter_number}"
    end

    private

    def chapter_hash
      @chapter_hash ||= @scripture_book.to_hash['chapters'][@chapter_number.to_i]
    end

    class DoesNotExist < StandardError; end;
  end
end
