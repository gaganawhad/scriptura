require 'spec_helper'

module Scriptura
  describe ScriptureBook do
    describe '#initialize' do
      it 'raises an error if the arugment cannot be converted to an integer' do
        expect { ScriptureBook.new(:a1) }.to raise_error(ArgumentError)
      end

      it 'raises an error if the book number is not within 1-66' do
        expect { ScriptureBook.new(67) }.to raise_error(Scriptura::ScriptureBook::DoesNotExist)
        expect { ScriptureBook.new(0) }.to raise_error(Scriptura::ScriptureBook::DoesNotExist)
      end

      it 'does not raise an error when the the number is within the range of 1-66' do
        expect { ScriptureBook.new(32) }.not_to raise_error
      end
    end

    describe '.find_by_name' do
      it 'initializes the ScriptureBook by the name' do
        @scripture_book = ScriptureBook.find_by_name('Romans')
        expect(@scripture_book).to be_an_instance_of(ScriptureBook)
        expect(@scripture_book.number).to eq(45)
      end

      it 'returns a helpful message when it doesn not find a book by the string passed to it' do
        expect { ScriptureBook.find_by_name('does not exist') }.to raise_error(Scriptura::ScriptureBook::DoesNotExist)
      end
    end

    describe '.find' do
      it "finds the book when a 'parameterised' string is passed to it" do
        @scripture_book = ScriptureBook.find('1-corinthians')
        expect(@scripture_book).to be_an_instance_of(ScriptureBook)
        expect(@scripture_book.number).to eq(46)
      end

      it 'returns a helpful message when it does not find a book by the string id passed to it' do
        expect { ScriptureBook.find('wrong-id') }.to raise_error(Scriptura::ScriptureBook::DoesNotExist)
      end
    end

    describe '#book_name' do
      it 'prints the name of the book' do
        expect(ScriptureBook.new(1).name).to eq('Genesis')
      end
    end

    describe '#number_of_chapters' do
      it 'returns the number of chapters' do
        expect(ScriptureBook.new(19).number_of_chapters).to eq(150)
      end
    end

    describe '#number' do
      it 'returns the serial number of the book' do
        expect(ScriptureBook.new(19).number).to eq(19)
      end
    end

    describe '#first_chapter' do
      it 'returns the first ScriptureChapter of that ScriptureBook' do
        @first_chapter = ScriptureBook.new(19).first_chapter
        expect(@first_chapter).to be_an_instance_of ScriptureChapter
        expect(@first_chapter.number).to eq(1)
      end
    end

    describe '#last_chapter' do
      it 'returns the last ScriptureChapter of that ScriptureBook' do
        @last_chapter = ScriptureBook.new(19).last_chapter
        expect(@last_chapter).to be_an_instance_of ScriptureChapter
        expect(@last_chapter.number).to eq(150)
      end
    end

    describe '#first_chapter_number' do
      it 'returns the first ScriptureChapter number of that ScriptureBook' do
        expect(ScriptureBook.new(19).first_chapter_number).to eq(1)
      end
    end

    describe '#last_chapter_number' do
      it 'returns the last ScriptureChapter number of that ScriptureBook' do
        expect(ScriptureBook.new(19).last_chapter_number).to eq(150)
      end
    end

    describe '#abbr_name' do
      it 'returns the abbreviation of the name of the scripture book' do
        expect(ScriptureBook.new(19).abbr_name).to eq('PSA')
      end
    end

    describe '#string_id' do
      it 'returns a human readable, pretty, string slug for the book in question' do
        expect(ScriptureBook.new(19).string_id).to eq('psalms')
      end
    end

    describe '#to_s' do
      it 'returns the name of the book' do
        expect(ScriptureBook.new(19).to_s).to eq('Psalms')
      end
    end

    describe '#==' do
      it 'returns a false when the other is not a ScriptureBook' do
        expect(ScriptureBook.new(19)).to_not eq double('Random Object', :number => 19)
                                                .as_null_object
      end

      it 'returns a false when it is not the identical book' do
        expect(ScriptureBook.new(19)).to_not eq ScriptureBook.new(20)
      end

      it 'returns a true when the other the identical scripture book' do
        expect(ScriptureBook.new(19)).to eq ScriptureBook.new(19)
      end
    end

    describe '#testament' do
      it 'returns the testament of the book' do
        genesis = ScriptureBook.new(1)
        malachi = ScriptureBook.new(39)
        matthew = ScriptureBook.new(40)
        revelation = ScriptureBook.new(66)
        expect(genesis.testament).to be_an_instance_of(Scriptura::Testament)
        expect(genesis.testament.name).to eq 'Old'
        expect(malachi.testament.name).to eq 'Old'
        expect(matthew.testament.name).to eq 'New'
        expect(revelation.testament.name).to eq 'New'
      end
    end
  end
end
