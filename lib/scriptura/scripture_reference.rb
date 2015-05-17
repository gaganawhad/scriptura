require 'scriptura/scripture_verse'

module Scriptura
  class ScriptureReference
    attr_reader :start_verse
    attr_reader :end_verse

    def initialize(start_verse, end_verse)
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

    def to_s
      case
      when spans_entire_book?
        start_verse.scripture_book.to_s
      when spans_entire_chapter?
        start_verse.scripture_chapter.to_s
      when spans_single_verse?
        start_verse.to_s
      when within_same_chapter?
        "#{start_verse}-#{end_verse.number}"
      when within_same_book?
        "#{start_verse} - #{end_verse.scripture_chapter.number}:#{end_verse.number}"
      else
        "#{start_verse} - #{end_verse}"
      end
    end
  end
end
