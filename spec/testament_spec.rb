require 'scriptura/testament'

module Scriptura
  describe Testament do
    describe '#initialize' do
      it "raises ArgumentError if argument isn't either 'Old' or 'New'" do
        expect { Testament.new('Genesis').name }.to raise_error ArgumentError
      end
    end

    describe '#name' do
      it 'returns the name of the book' do
        expect(Testament.new('Old').name).to eq 'Old'
        expect(Testament.new('New').name).to eq 'New'
      end
    end

    describe '#string_id' do
      it 'returns the name of the book' do
        expect(Testament.new('Old').string_id).to eq 'old'
        expect(Testament.new('New').string_id).to eq 'new'
      end
    end
  end
end
