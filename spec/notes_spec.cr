require "./spec_helper"

describe Medley::Notes do

  describe ".halfstep_up" do
    it "returns G# when given G" do
      note = Medley::Notes.new("G")
      note.halfstep_up.should eq "G#"
    end

    it "returns B# when given B" do
      note = Medley::Notes.new("B")
      note.halfstep_up.should eq "B#"
    end

    it "returns D## when given D#" do
      note = Medley::Notes.new("D#")
      note.halfstep_up.should eq "D##"
    end

    it "returns B when given Bb" do
      note = Medley::Notes.new("Bb")
      note.halfstep_up.should eq "B"
    end

    it "returns F## when given E##" do
      note = Medley::Notes.new("E##")
      note.halfstep_up.should eq "F##"
    end
  end

  #describe ".wholestep_up" do
  #  it "returns A when given G" do
  #    note = Medley::Notes.new("G")
  #    note.wholestep_up.should eq "A"
  #  end

  #  it "returns F for Eb" do
  #    note = Medley::Notes.new("Eb")
  #    note.wholestep_up.should eq "F"
  #  end

  #  it "returns F# for E" do
  #    note = Medley::Notes.new("E")
  #    note.wholestep_up.should eq "F#"
  #  end
  #end
end
