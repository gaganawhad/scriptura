require 'spec_helper'

describe ScriptureMeta do 
  describe '.old_testament_books' do
    it 'returns all the OT books in an array' do 
      @result = ScriptureMeta.old_testament_books
      @result.should be_instance_of(Array)
      @result.map(&:number).should == (1..39).to_a
    end
  end

  describe '.new_testament_books' do
    it 'returns all the NT books in an array' do 
      @result = ScriptureMeta.new_testament_books
      @result.should be_instance_of(Array)
      @result.map(&:number).should == (40..66).to_a
    end
  end

  describe '.books' do
    it 'returns all the books in an array' do 
      @result = ScriptureMeta.books
      @result.should be_instance_of(Array)
      @result.map(&:number).should == (1..66).to_a
    end
  end

  describe '.book_names' do
    it 'returns all the books in an array' do 
      @result = ScriptureMeta.book_names
      @result.should be_instance_of(Array)
      @result[0].should == 'Genesis'
      @result[1].should == 'Exodus'
      @result[65].should == 'Revelation'
    end
  end
end
