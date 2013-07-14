require 'spec_helper'

describe ScriptureBook do
  describe '#initialize' do 
    it 'raises an error if the arugment cannot be converted to a string' do
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
end
