require "./spec_helper"

describe Medley::Scales do

  describe ".notes" do
    it "returns an array of letters in C major scale order" do
      scale = Medley::Scales.new("Cmaj")
      scale.notes.should eq(["C", "D", "E", "F", "G", "A", "B", "C"])
    end

    it "returns an array of letters in F major scale order" do
      scale = Medley::Scales.new("Fmaj")
      scale.notes.should eq(["F", "G", "A", "Bb", "C", "D", "E", "F"])
    end
  end
end
