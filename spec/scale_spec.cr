require "./spec_helper"

describe Medley::Scale do

  describe ".notes" do
    it "returns an array of letters in C major scale order" do
      scale = Medley::Scale.new("Cmaj")
      scale.notes.should eq(["C", "D", "E", "F", "G", "A", "B", "C"])
    end

    it "returns an array of letters in F major scale order" do
      scale = Medley::Scale.new("Fmaj")
      scale.notes.should eq(["F", "G", "A", "Bb", "C", "D", "E", "F"])
    end

    it "returns an array of letters in D Major scale order" do
      scale = Medley::Scale.new("Dmaj")
      scale.notes.should eq(["D", "E", "F#", "G", "A", "B", "C#", "D"])
    end

    it "returns an array of letters Bb Major scale order" do
      scale = Medley::Scale.new("Bbmaj")
      scale.notes.should eq(["Bb", "C", "D", "Eb", "F", "G", "A", "Bb"])
    end

    it "returns an array of letters in the C minor scale order" do
      scale = Medley::Scale.new("Cmin")
      scale.notes.should eq(["C", "D", "Eb", "F", "G", "Ab", "Bb", "C"])
    end
  end

  describe ".key" do
    it "returns the key with 2 flats" do
      scale = Medley::Scale.new("Bbmaj")
      scale.key.flats.size.should eq 2
    end
  end

  describe ".pattern" do
    it "returns an array of notes in the order of the pattern" do
      scale = Medley::Scale.new("Cmaj")
      scale.pattern(1, 6, 4, 5).should eq ["C", "A", "F", "G"]
    end
    it "raises an error when you pass 0 in the pattern" do
      scale = Medley::Scale.new("Cmaj")
      expect_raises(Medley::InvalidPatternError, "Note arrays are not 0 based index") do
        scale.pattern(0, 1)
      end
    end
    it "wraps around if the value is greater than 7" do
      scale = Medley::Scale.new("Cmaj")
      scale.pattern(8, 12, 4, 10).should eq ["C", "G", "F", "E"]
    end
  end
end
