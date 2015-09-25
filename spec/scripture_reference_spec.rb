require 'spec_helper'

module Scriptura
  describe ScriptureReference do
    describe '#within_same_book?' do
      it 'returns a true when the start verse is Gen 1:1 and end verse is Gen 50:26' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 50, 26))
        expect(@scripture_reference.within_same_book?).to eq(true)
      end

      it 'returns a true when the start verse is Gen 3:1 and end verse is Gen 3:5' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 3, 1), ScriptureVerse.new(1, 3, 5))
        expect(@scripture_reference.within_same_book?).to eq(true)
      end

      it 'returns a true when the start verse is Gen 1:1 and end verse is Exo 1:1' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 1, 1))
        expect(@scripture_reference.within_same_book?).to eq(false)
      end
    end

    describe '#within_same_chapter?' do
      it 'returns a true when the start verse is Gen 1:1 and end verse is Gen 1:12' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 12))
        expect(@scripture_reference.within_same_book?).to eq(true)
      end

      it 'returns a true when the start verse is Gen 3:1 and end verse is Gen 3:5' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 3, 1), ScriptureVerse.new(1, 3, 5))
        expect(@scripture_reference.within_same_book?).to eq(true)
      end

      it 'returns a true when the start verse is Gen 1:1 and end verse is Exo 1:1' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 1, 1))
        expect(@scripture_reference.within_same_book?).to eq(false)
      end
    end

    describe '#spans_entire_book?' do
      it 'returns a true when the start verse is Gen 1:1 and end verse is Gen 50:26' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 50, 26))
        expect(@scripture_reference.spans_entire_book?).to eq(true)
      end

      it 'returns false when the verse spans two books' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 40, 38))
        expect(@scripture_reference.spans_entire_book?).to eq(false)
      end

      it 'returns a false when the start verse is Gen 1:2 and end verse is Gen 50:26' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 2), ScriptureVerse.new(1, 50, 26))
        expect(@scripture_reference.spans_entire_book?).to eq(false)
      end

      it 'returns a false when the start verse is Gen 1:1 and end verse is Gen 50:25' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 50, 25))
        expect(@scripture_reference.spans_entire_book?).to eq(false)
      end
    end

    describe '#spans_entire_chapter?' do
      it 'returns a true when the start verse is Gen 50:1 and end verse is Gen 50:26' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 50, 1), ScriptureVerse.new(1, 50, 26))
        expect(@scripture_reference.spans_entire_chapter?).to eq(true)
      end

      it 'returns false when the verse spans two chapters' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 2, 25))
        expect(@scripture_reference.spans_entire_book?).to eq(false)
      end

      it 'returns a false when the start verse is Gen 50:2 and end verse is Gen 50:26' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 50, 2), ScriptureVerse.new(1, 50, 26))
        expect(@scripture_reference.spans_entire_chapter?).to eq(false)
      end

      it 'returns a false when the start verse is Gen 50:1 and end verse is Gen 50:25' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 50, 1), ScriptureVerse.new(1, 50, 25))
        expect(@scripture_reference.spans_entire_chapter?).to eq(false)
      end

      it 'returns a false when the start verse is Gen 49:1 and end verse is Gen 50:25' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 49, 1), ScriptureVerse.new(1, 50, 25))
        expect(@scripture_reference.spans_entire_chapter?).to eq(false)
      end

      it 'returns a false when the start verse is Gen 1:1 and end verse is Exo 1:22' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 1, 22))
        expect(@scripture_reference.spans_entire_chapter?).to eq(false)
      end
    end

    describe '#spans_single_verse?' do
      it 'returns a true when the start verse is Gen 1:1 and end verse is Gen 1:1' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 1))
        expect(@scripture_reference.spans_single_verse?).to eq(true)
      end

      it 'returns a false when the start verse is Gen 1:1 and end verse is Gen 1:2' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 2))
        expect(@scripture_reference.spans_single_verse?).to eq(false)
      end

      it 'returns a false when the start verse is Gen 1:1 and end verse is Gen 2:1' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 2, 1))
        expect(@scripture_reference.spans_single_verse?).to eq(false)
      end

      it 'returns a false when the start verse is Gen 1:1 and end verse is Exo 1:2' do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 1, 2))
        expect(@scripture_reference.spans_single_verse?).to eq(false)
      end
    end

    describe '#to_s' do
      it "returns 'Genesis' when it spans the entire book of Genesis" do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 50, 26))
        expect(@scripture_reference.to_s).to eq('Genesis')
      end

      it "returns 'Gen 1' when it spans the entire chapter of Genesis 1" do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 31))
        expect(@scripture_reference.to_s).to eq('Genesis 1')
      end

      it "returns 'Genesis 1:1' when it only covers one verse" do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 1))
        expect(@scripture_reference.to_s).to eq('Genesis 1:1')
      end

      it "returns 'Genesis 1:1–2'" do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 2))
        expect(@scripture_reference.to_s).to eq('Genesis 1:1–2')
      end

      it "returns 'Genesis 1:1–3:2'" do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 3, 2))
        expect(@scripture_reference.to_s).to eq('Genesis 1:1–3:2')
      end

      it "returns 'Genesis 1:1 – Exodus 3:2'" do
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 3, 2))
        expect(@scripture_reference.to_s).to eq('Genesis 1:1 – Exodus 3:2')
      end
    end
  end
end
