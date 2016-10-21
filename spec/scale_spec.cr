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
end
