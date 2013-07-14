require 'spec_helper'

describe ScriptureBook do

  describe '#book_name' do
    it 'prints the name of the book' do
      ScriptureBook.new(1).name.should == 'Genesis'
    end
  end
end
