require 'spec_helper'

module Scriptura
  describe Scripture do
    describe '.old_testament_books' do
      it 'returns all the OT books in an array' do
        @result = Scripture.old_testament_books
        expect(@result).to be_instance_of(Array)
        expect(@result.map(&:number)).to eq((1..39).to_a)
      end
    end

    describe '.new_testament_books' do
      it 'returns all the NT books in an array' do
        @result = Scripture.new_testament_books
        expect(@result).to be_instance_of(Array)
        expect(@result.map(&:number)).to eq((40..66).to_a)
      end
    end

    describe '.books' do
      it 'returns all the books in an array' do
        @result = Scripture.books
        expect(@result).to be_instance_of(Array)
        expect(@result.map(&:number)).to eq((1..66).to_a)
      end
    end

    describe '.book_names' do
      it 'returns all the books in an array' do
        @result = Scripture.book_names
        expect(@result).to be_instance_of(Array)
        expect(@result[0]).to eq('Genesis')
        expect(@result[1]).to eq('Exodus')
        expect(@result[65]).to eq('Revelation')
      end
    end
  end
end
