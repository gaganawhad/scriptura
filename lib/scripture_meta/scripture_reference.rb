module ScriptureMeta
  class ScriptureReference
    attr_accessor :start_verse
    attr_accessor :end_verse

    def initialize start_verse, end_verse
      @start_verse = start_verse
      @end_verse = end_verse
    end

    def within_same_book?
      start_verse.scripture_book.number == end_verse.scripture_book.number
    end

    def within_same_chapter?
      within_same_book? && 
      start_verse.scripture_chapter.number == end_verse.scripture_chapter.number
    end
    
    def spans_entire_book?
      within_same_book? && 
      start_verse.scripture_chapter.number == start_verse.scripture_book.first_chapter.number && 
      start_verse.number == start_verse.scripture_chapter.first_verse.number &&
      end_verse.scripture_chapter.number == end_verse.scripture_book.last_chapter.number && 
      end_verse.number == end_verse.scripture_chapter.last_verse.number
    end

    def spans_entire_chapter?
      within_same_chapter? && 
      start_verse.number == start_verse.scripture_chapter.first_verse.number &&
      end_verse.number == end_verse.scripture_chapter.last_verse.number 
    end

    def spans_single_verse?
      within_same_chapter? &&
      start_verse.number == end_verse.number
    end
  end
end
