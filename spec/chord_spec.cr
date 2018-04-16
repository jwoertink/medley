require "./spec_helper"

describe Medley::Chord do
  describe ".notes" do
    it "returns an array of letters in the Gmaj scale G chord" do
      Medley::Scale.new("Gmaj").chord("G").notes.should eq(["G", "B", "D"])
    end

    it "returns an array of letters in the Gmin scale G chord" do
      Medley::Scale.new("Gmin").chord("C").notes.should eq(["C", "Eb", "G"])
    end

    it "returns an array of letters in the Aphrygian scale A chord" do
      Medley::Scale.new("Aphrygian").chord("A").notes.should eq(["A", "C", "E"])
    end

    it "returns an array of letters in the Aphrygian scale E chord" do
      Medley::Scale.new("Aphrygian").chord("E").notes.should eq(["E", "G", "Bb"])
    end
  end
end
