require 'spec_helper'

describe ScriptureVerse do 
  describe '#initialize' do 
    it 'raises an error if either of the arugments cannot be converted to an integer' do

      lambda { ScriptureVerse.new(:a1, 1, 4) }.should raise_error(ArgumentError)
      lambda { ScriptureVerse.new(3, :asdf, 4) }.should raise_error(ArgumentError)
      lambda { ScriptureVerse.new(3, 2, :four) }.should raise_error(ArgumentError)
    end

    it 'raises an error if the book number is not within 1-66' do
      lambda { ScriptureVerse.new(67, 34, 12) }.should raise_error(RuntimeError)
      lambda { ScriptureVerse.new(0, 34, 12) }.should raise_error(RuntimeError)
    end

    it 'raises an error when the chapter does not exist' do 
      lambda { ScriptureVerse.new(19, 151, 1) }.should raise_error(RuntimeError)
    end

    it 'raises an error when the verse does not exist' do 
      lambda { ScriptureVerse.new(19, 119, 500 ) }.should raise_error(RuntimeError)
    end

    it 'does not raise an error when the verse exists' do
      lambda { ScriptureVerse.new(32, 2, 2) }.should_not raise_error
    end

    it 'stores the verse number as in integer' do 
      ScriptureVerse.new('1', '2', '3').number.should == 3
    end
  end

  describe '#normalize' do
    context 'it converts a scripture verse to a normalized unique value over the range of scripture verses' do
      it "returns 1,001,001 for scripture verse referring to Genesis 1:1 " do
        ScriptureVerse.new(1,1,1).normalize.should == 1001001
      end

      it "returns 66,022,021 for scripture verse referring to Genesis 1:1 " do
        ScriptureVerse.new(66,22,21).normalize.should == 66022021
      end

      it "returns 19,119,176 for scripture verse referring to Psalm 119:176 " do
        ScriptureVerse.new(19,119,176).normalize.should == 19119176
      end
    end
  end

  describe '#number' do 
    it 'returns the scripture of the verse' do 
      ScriptureVerse.new(12, 1, 8).number.should == 8
    end
  end
end
