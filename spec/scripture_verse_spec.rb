require 'spec_helper'

module Scriptura
  describe ScriptureVerse do
    describe '#initialize' do
      it 'raises an error if either of the arugments cannot be converted to an integer' do
        expect { ScriptureVerse.new(:a1, 1, 4) }.to raise_error(ArgumentError)
        expect { ScriptureVerse.new(3, :asdf, 4) }.to raise_error(ArgumentError)
        expect { ScriptureVerse.new(3, 2, :four) }.to raise_error(ArgumentError)
      end

      it 'raises an error if the book number is not within 1-66' do
        expect { ScriptureVerse.new(67, 34, 12) }.to raise_error(RuntimeError)
        expect { ScriptureVerse.new(0, 34, 12) }.to raise_error(RuntimeError)
      end

      it 'raises an error when the chapter does not exist' do
        expect { ScriptureVerse.new(19, 151, 1) }.to raise_error(RuntimeError)
      end

      it 'raises an error when the verse does not exist' do
        expect { ScriptureVerse.new(19, 119, 500) }.to raise_error(RuntimeError)
      end

      it 'does not raise an error when the verse exists' do
        expect { ScriptureVerse.new(32, 2, 2) }.not_to raise_error
      end

      it 'stores the verse number as in integer' do
        expect(ScriptureVerse.new('1', '2', '3').number).to eq(3)
      end

      it 'initializes scripture verse to Gen 1:1 when 1001001 is passed to it' do
        @scripture_verse = ScriptureVerse.new(1_001_001)
        expect(@scripture_verse).to be_a(ScriptureVerse)
        expect(@scripture_verse.scripture_book.number).to eq(1)
        expect(@scripture_verse.scripture_chapter.number).to eq(1)
        expect(@scripture_verse.number).to eq(1)
      end

      it 'initializes scripture verse to Psalm 119:176 when 19119176 is passed to it' do
        @scripture_verse = ScriptureVerse.new(19_119_176)
        expect(@scripture_verse).to be_a(ScriptureVerse)
        expect(@scripture_verse.scripture_book.number).to eq(19)
        expect(@scripture_verse.scripture_chapter.number).to eq(119)
        expect(@scripture_verse.number).to eq(176)
      end
    end

    describe '#normalize' do
      context 'it converts a scripture verse to a normalized unique value over the range of scripture verses' do
        it 'returns 1,001,001 for scripture verse referring to Genesis 1:1 ' do
          expect(ScriptureVerse.new(1, 1, 1).normalize).to eq(1_001_001)
        end

        it 'returns 66,022,021 for scripture verse referring to Rev 22:21 ' do
          expect(ScriptureVerse.new(66, 22, 21).normalize).to eq(66_022_021)
        end

        it 'returns 19,119,176 for scripture verse referring to Psalm 119:176 ' do
          expect(ScriptureVerse.new(19, 119, 176).normalize).to eq(19_119_176)
        end
      end
    end

    describe '#number' do
      it 'returns the scripture of the verse' do
        expect(ScriptureVerse.new(12, 1, 8).number).to eq(8)
      end
    end
  end
end
