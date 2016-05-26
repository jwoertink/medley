require "./spec_helper"

describe Medley::Notes do
  describe "#by_scale" do
    it "returns an array of letters in C major scale order" do
      Medley::Notes.by_scale("Cmaj").should eq ["C", "D", "E", "F", "G", "A", "B", "C"]
    end
  end
end
