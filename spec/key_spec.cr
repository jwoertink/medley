require "./spec_helper"

describe Medley::Key do

  describe ".flats" do
    it "returns an array with 3 flat notes" do
      scale = Medley::Scale.new("Ebmaj")
      key = Medley::Key.new(scale)
      key.flats.size.should eq 3
      key.flats.should eq(["Eb", "Ab", "Bb"])
      key.sharps.empty?.should eq true
    end

    it "returns an array with 2 sharp notes" do
      scale = Medley::Scale.new("Bmin")
      key = Medley::Key.new(scale)
      key.sharps.size.should eq 2
      key.sharps.should eq(["C#", "F#"])
      key.flats.empty?.should eq true
    end
  end
  
  describe ".name" do
    it "returns the Gmaj" do
      scale = Medley::Scale.new("Gmaj")
      key = Medley::Key.new(scale)
      key.name.should eq "Gmaj"
    end
  end
end
