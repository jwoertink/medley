require "./spec_helper"

describe Medley::Note do

  describe ".halfstep_up" do
    it "returns G# when given G" do
      note = Medley::Note.new("G")
      note.halfstep_up.should eq "G#"
    end

    it "returns B# when given B" do
      note = Medley::Note.new("B")
      note.halfstep_up.should eq "B#"
    end

    it "returns D## when given D#" do
      note = Medley::Note.new("D#")
      note.halfstep_up.should eq "D##"
    end

    it "returns B when given Bb" do
      note = Medley::Note.new("Bb")
      note.halfstep_up.should eq "B"
    end

    it "returns F## when given E##" do
      note = Medley::Note.new("E##")
      note.halfstep_up.should eq "F##"
    end
  end

end
