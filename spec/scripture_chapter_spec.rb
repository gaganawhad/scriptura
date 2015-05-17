require 'spec_helper'

module Scriptura
  describe ScriptureChapter do
    describe '#initialize' do
      it 'raises an error if either of the arugments cannot be converted to an integer' do
        expect { ScriptureChapter.new(:a1, 1) }.to raise_error(ArgumentError)
        expect { ScriptureChapter.new(3, :asdf) }.to raise_error(ArgumentError)
      end

      it 'raises an error if the book number is not within 1-66' do
        expect { ScriptureChapter.new(67, 34) }.to raise_error(Scriptura::ScriptureBook::DoesNotExist)
        expect { ScriptureChapter.new(0, 34) }.to raise_error(Scriptura::ScriptureBook::DoesNotExist)
      end

      it 'raises an error when the chapter does not exist' do
        expect { ScriptureChapter.new(19, 151) }.to raise_error(Scriptura::ScriptureChapter::DoesNotExist)
      end

      it 'does not raise an error when the the book number is within the range of 1-66' do
        expect { ScriptureChapter.new(32, 2) }.not_to raise_error
      end
    end

    describe '#number' do
      it 'returns the chapter number of the chapter' do
        expect(ScriptureChapter.new(19, 12).number).to eq(12)
      end
    end

    describe '#number_of_verses' do
      it 'returns the number of versres in a chapter' do
        expect(ScriptureChapter.new(19, 119).number_of_verses).to eq(176)
      end
    end

    describe '#first_verse' do
      it 'returns the first ScriptureVerse of that ScriptureChapter' do
        @first_verse = ScriptureChapter.new(19, 119).first_verse
        expect(@first_verse).to be_an_instance_of ScriptureVerse
        expect(@first_verse.number).to eq(1)
      end
    end

    describe '#last_verse' do
      it 'returns the last ScriptureVerse of that ScriptureChapter' do
        @last_verse = ScriptureChapter.new(19, 119).last_verse
        expect(@last_verse).to be_an_instance_of ScriptureVerse
        expect(@last_verse.number).to eq(176)
      end
    end

    describe '#first_verse_number' do
      it 'returns the first ScriptureVerse number of that ScriptureChapter' do
        expect(ScriptureChapter.new(19, 119).first_verse_number).to eq(1)
      end
    end

    describe '#last_verse_number' do
      it 'returns the last ScriptureVerse number of that ScriptureChapter' do
        expect(ScriptureChapter.new(19, 119).last_verse_number).to eq(176)
      end
    end

    describe '#to_s' do
      it 'returns the book name and chapter number of the book' do
        expect(ScriptureChapter.new(19, 119).to_s).to eq('Psalms 119')
      end
    end
  end
end
