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
end
