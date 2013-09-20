module ScriptureMeta
  class ScriptureBook
    def initialize(number)
      raise ArgumentError, 'book number cannot be converted to an integer' unless number.respond_to?(:to_i)
      raise 'book number should be within 1-66' unless (1..66).cover?(number.to_i)
      @number = number.to_i
    end

    def self.find_by_name name
      hash = METADATA.find{|book| book['name'] == name}
      raise "Book by the name #{name} was not found! Check if there was a spelling error.. or try initializing it with a book number" if hash.nil?
      self.new(hash['number'])
    end

    def self.find string_id
      hash = METADATA.find{|book| book['string_id'] == string_id}
      raise "Book by the string_id #{string_id} was not found! Check if there was a spelling error.. or try initializing it with a book number" if hash.nil?
      self.new(hash['number'])
    end

    def name
      book_hash['name']
    end

    def number_of_chapters
      book_hash['chapters'].count
    end

    def number
      book_hash['number']
    end

    def first_chapter
      @first_chapter ||= ScriptureChapter.new(self.number, 1)
    end

    def last_chapter
      @last_chapter ||= ScriptureChapter.new(self.number, self.number_of_chapters)
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
    
    private

    def book_hash
      @book_hash ||= METADATA.find{|book| book['number'] == @number.to_i}
    end
  end
end
