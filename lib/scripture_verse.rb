class ScriptureVerse
  @verse_number
  
  def initialize
    @chapter = SciptureChapter.new
  end

  def book
    @chapter.book
  end

  def exists?
  end
end
