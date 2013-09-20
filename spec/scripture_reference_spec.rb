require 'spec_helper'

module ScriptureMeta 
  describe ScriptureReference do 
    describe "#within_same_book?" do 
      it "returns a true when the start verse is Gen 1:1 and end verse is Gen 50:26" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 50, 26))
        @scripture_reference.within_same_book?.should == true
      end

      it "returns a true when the start verse is Gen 3:1 and end verse is Gen 3:5" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 3, 1), ScriptureVerse.new(1, 3, 5))
        @scripture_reference.within_same_book?.should == true
      end

      it "returns a true when the start verse is Gen 1:1 and end verse is Exo 1:1" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 1, 1))
        @scripture_reference.within_same_book?.should == false
      end
    end

    describe "#within_same_chapter?" do 
      it "returns a true when the start verse is Gen 1:1 and end verse is Gen 1:12" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 12))
        @scripture_reference.within_same_book?.should == true
      end

      it "returns a true when the start verse is Gen 3:1 and end verse is Gen 3:5" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 3, 1), ScriptureVerse.new(1, 3, 5))
        @scripture_reference.within_same_book?.should == true
      end

      it "returns a true when the start verse is Gen 1:1 and end verse is Exo 1:1" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 1, 1))
        @scripture_reference.within_same_book?.should == false
      end
    end

    describe "#spans_entire_book?" do 
      it "returns a true when the start verse is Gen 1:1 and end verse is Gen 50:26" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 50, 26))
        @scripture_reference.spans_entire_book?.should == true
      end

      it "returns a false when the start verse is Gen 1:2 and end verse is Gen 50:26" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 2), ScriptureVerse.new(1, 50, 26))
        @scripture_reference.spans_entire_book?.should == false
      end

      it "returns a false when the start verse is Gen 1:1 and end verse is Gen 50:25" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 50, 25))
        @scripture_reference.spans_entire_book?.should == false
      end
    end

    describe "#spans_entire_chapter?" do 
      it "returns a true when the start verse is Gen 50:1 and end verse is Gen 50:26" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 50, 1), ScriptureVerse.new(1, 50, 26))
        @scripture_reference.spans_entire_chapter?.should == true
      end

      it "returns a false when the start verse is Gen 50:2 and end verse is Gen 50:26" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 50, 2), ScriptureVerse.new(1, 50, 26))
        @scripture_reference.spans_entire_chapter?.should == false
      end

      it "returns a false when the start verse is Gen 50:1 and end verse is Gen 50:25" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 50, 1), ScriptureVerse.new(1, 50, 25))
        @scripture_reference.spans_entire_chapter?.should == false
      end

      it "returns a false when the start verse is Gen 49:1 and end verse is Gen 50:25" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 49, 1), ScriptureVerse.new(1, 50, 25))
        @scripture_reference.spans_entire_chapter?.should == false
      end

      it "returns a false when the start verse is Gen 1:1 and end verse is Exo 1:22" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 1, 22))
        @scripture_reference.spans_entire_chapter?.should == false
      end
    end

    describe "#spans_single_verse?" do 
      it "returns a true when the start verse is Gen 1:1 and end verse is Gen 1:1" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 1))
        @scripture_reference.spans_single_verse?.should == true
      end

      it "returns a false when the start verse is Gen 1:1 and end verse is Gen 1:2" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 1, 2))
        @scripture_reference.spans_single_verse?.should == false
      end

      it "returns a false when the start verse is Gen 1:1 and end verse is Gen 2:1" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(1, 2, 1))
        @scripture_reference.spans_single_verse?.should == false
      end

      it "returns a false when the start verse is Gen 1:1 and end verse is Exo 1:2" do 
        @scripture_reference = ScriptureReference.new(ScriptureVerse.new(1, 1, 1), ScriptureVerse.new(2, 1, 2))
        @scripture_reference.spans_single_verse?.should == false
      end
    end
  end
end
