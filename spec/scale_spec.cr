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
  end
end
