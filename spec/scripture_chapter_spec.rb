require 'spec_helper'

describe ScriptureChapter do 
  describe '#initialize' do 
    it 'raises an error if either of the arugments cannot be converted to an integer' do
      lambda { ScriptureChapter.new(:a1, 1) }.should raise_error(ArgumentError)
      lambda { ScriptureChapter.new(3, :asdf) }.should raise_error(ArgumentError)
    end

    it 'raises an error if the book number is not within 1-66' do
      lambda { ScriptureChapter.new(67, 34) }.should raise_error(RuntimeError)
      lambda { ScriptureChapter.new(0, 34) }.should raise_error(RuntimeError)
    end

    it 'raises an error when the chapter does not exist' do 
      lambda { ScriptureChapter.new(19, 151) }.should raise_error(RuntimeError)
    end

    it 'does not raise an error when the the book number is within the range of 1-66' do
      lambda { ScriptureChapter.new(32, 2) }.should_not raise_error
    end
  end

  describe '#number' do
    it 'returns the chapter number of the chapter' do 
      ScriptureChapter.new(19, 12).number.should == 12
    end
  end

  describe '#number_of_verses' do
    it 'returns the number of versres in a chapter' do 
      ScriptureChapter.new(19, 119).number_of_verses.should == 176
    end
  end

  describe '#first_verse' do 
    it 'returns the first ScriptureVerse of that ScriptureChapter' do
      @first_verse = ScriptureChapter.new(19, 119).first_verse
      @first_verse.should be_an_instance_of ScriptureVerse
      @first_verse.number.should == 1
    end
  end

  describe '#last_verse' do 
    it 'returns the last ScriptureVerse of that ScriptureChapter' do
      @last_verse = ScriptureChapter.new(19, 119).last_verse
      @last_verse.should be_an_instance_of ScriptureVerse
      @last_verse.number.should == 176
    end
  end

  describe '#first_verse_number' do 
    it 'returns the first ScriptureVerse number of that ScriptureChapter' do
      ScriptureChapter.new(19, 119).first_verse_number.should == 1
    end
  end

  describe '#last_verse_number' do 
    it 'returns the last ScriptureVerse number of that ScriptureChapter' do
      ScriptureChapter.new(19, 119).last_verse_number.should == 176
    end
  end
end
