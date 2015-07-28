require 'scriptura/scripture_chapter'

module Scriptura
  class ScriptureVerse
    attr_reader :scripture_book
    attr_reader :scripture_chapter
    attr_reader :verse_number
    alias_method :number, :verse_number

    def initialize(*args)
      book_number, chapter_number, verse_number = extract_arguments(args)

      @scripture_chapter = ScriptureChapter.new(book_number, chapter_number)
      @scripture_book = @scripture_chapter.scripture_book
      fail ArgumentError, 'verse number cannot be converted to an integer' unless verse_number.respond_to?(:to_i)
      fail DoesNotExist, 'verse number does not exist' unless (1..@scripture_chapter.number_of_verses).cover? verse_number.to_i
      @verse_number = verse_number.to_i
    end

    def normalize
      scripture_book.number * 1_000_000 + scripture_chapter.number * 1000 + @verse_number
    end

    def to_s
      "#{scripture_chapter}:#{number}"
    end

    def ==(other)
      return false unless other.is_a?(ScriptureVerse)
      scripture_book == other.scripture_book &&
        scripture_chapter == other.scripture_chapter &&
        verse_number == other.verse_number
    end

    private

    def extract_arguments args
      case args.count
      when 1
        fail ArgumentError, 'normalized value of scripture verse cannot be converted to an integer' unless args[0].respond_to?(:to_i)
        book_number, chapter_number, verse_number = de_normalize(args[0].to_i)
      when 3
        book_number, chapter_number, verse_number = args
      else
        fail ArgumentError, 'wrong number of arguments! The arguments should either be one normalized value for the verse or 3 separate book, chapter, verse numbers'
      end
    end

    def de_normalize(number)
      quotient, verse_number = number.divmod(1000)
      book_number, chapter_number = quotient.divmod(1000)
      [book_number, chapter_number, verse_number]
    end

    class DoesNotExist < StandardError; end
  end
end
