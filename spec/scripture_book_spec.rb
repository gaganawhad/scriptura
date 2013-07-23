require 'spec_helper'

describe ScriptureBook do
  describe '#initialize' do 
    it 'raises an error if the arugment cannot be converted to an integer' do
      lambda { ScriptureBook.new(:a1) }.should raise_error(ArgumentError)
    end

    it 'raises an error if the book number is not within 1-66' do
      lambda { ScriptureBook.new(67) }.should raise_error(RuntimeError)
      lambda { ScriptureBook.new(0) }.should raise_error(RuntimeError)
    end

    it 'does not raise an error when the the number is within the range of 1-66' do
      lambda { ScriptureBook.new(32) }.should_not raise_error
    end
  end

  describe '.find_by_name' do 
    it 'initializes the ScriptureBook by the name' do
      @scripture_book = ScriptureBook.find_by_name('Romans')
      @scripture_book.should be_an_instance_of(ScriptureBook)
      @scripture_book.number.should == 45
    end

    it 'returns a helpful message when it doesn not find a book by the string passed to it' do 
      lambda { ScriptureBook.find_by_name('does not exist') }.should raise_error
    end
  end

  describe '.find' do 
    it "finds the book when a 'parameterised' string is passed to it" do
      @scripture_book = ScriptureBook.find('1-corinthians')
      @scripture_book.should be_an_instance_of(ScriptureBook)
      @scripture_book.number.should == 46
    end

    it 'returns a helpful message when it does not find a book by the string id passed to it' do 
      lambda { ScriptureBook.find('wrong-id') }.should raise_error
    end
  end

  describe '#book_name' do
    it 'prints the name of the book' do
      ScriptureBook.new(1).name.should == 'Genesis'
    end
  end

  describe '#number_of_chapters' do 
    it 'returns the number of chapters' do
      ScriptureBook.new(19).number_of_chapters.should == 150
    end
  end

  describe '#number' do 
    it 'returns the serial number of the book' do
      ScriptureBook.new(19).number.should == 19
    end
  end

  describe '#first_chapter' do 
    it 'returns the first ScriptureChapter of that ScriptureBook' do
      @first_chapter = ScriptureBook.new(19).first_chapter
      @first_chapter.should be_an_instance_of ScriptureChapter
      @first_chapter.number.should == 1
    end
  end

  describe '#last_chapter' do 
    it 'returns the last ScriptureChapter of that ScriptureBook' do
      @last_chapter = ScriptureBook.new(19).last_chapter
      @last_chapter.should be_an_instance_of ScriptureChapter
      @last_chapter.number.should == 150
    end
  end

  describe '#first_chapter_number' do 
    it 'returns the first ScriptureChapter number of that ScriptureBook' do
      ScriptureBook.new(19).first_chapter_number.should == 1
    end
  end

  describe '#last_chapter_number' do 
    it 'returns the last ScriptureChapter number of that ScriptureBook' do
      ScriptureBook.new(19).last_chapter_number.should == 150
    end
  end
end
