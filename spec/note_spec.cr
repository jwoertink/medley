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

  describe ".halfstep_down" do
    it "returns G when given G#" do
      note = Medley::Note.new("G#")
      note.halfstep_down.should eq "G"
    end

    it "returns B when given B#" do
      note = Medley::Note.new("B#")
      note.halfstep_down.should eq "B"
    end

    it "returns Dbb when given Db" do
      note = Medley::Note.new("Db")
      note.halfstep_down.should eq "Dbb"
    end

    it "returns Cbb when given Cb" do
      note = Medley::Note.new("Cb")
      note.halfstep_down.should eq "Cbb"
    end

    it "returns Ebb when given Fbb" do
      note = Medley::Note.new("Fbb")
      note.halfstep_down.should eq "Ebb"
    end
  end

  describe ".wholestep_up" do
    it "returns E when given D" do
      note = Medley::Note.new("D")
      note.wholestep_up.should eq "E"
    end

    it "returns G when given F" do
      note = Medley::Note.new("F")
      note.wholestep_up.should eq "G"
    end

    it "returns D# when given C#" do
      note = Medley::Note.new("C#")
      note.wholestep_up.should eq "D#"
    end

    it "returns Bb when given Ab" do
      note = Medley::Note.new("Ab")
      note.wholestep_up.should eq "Bb"
    end

    it "returns C when given Bb" do
      note = Medley::Note.new("Bb")
      note.wholestep_up.should eq "C"
    end

    it "returns Dbb when given Cbb" do
      note = Medley::Note.new("Cbb")
      note.wholestep_up.should eq "Dbb"
    end
  end

  describe ".next_root" do
    it "returns C when given B" do
      note = Medley::Note.new("B")
      note.next_root.should eq "C"
    end

    it "returns F when given E" do
      note = Medley::Note.new("E")
      note.next_root.should eq "F"
    end
  end

end
