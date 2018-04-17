module Medley
  class Chord
    include Comparable(Chord)

    getter :scale
    getter :root

    def initialize(scale : Scale, root : String)
      @scale = scale
      @root = root
      @notes = [] of String
      build_chord(1, 3, 5)
    end

    def to_s(io)
      io << "#{@root}#{degree} (#{@notes.join(" ")})"
    end

    def ==(other : Chord)
      self.scale.name == other.scale.name && self.root == other.root
    end

    def notes
      @notes
    end

    private def build_chord(*pattern : Int32)
      range = @scale.notes[0..-2] * 2
      root_index = range.index(@root).as(Int32)
      pattern.each do |i|
        @notes << range[root_index + (i - 1)]
      end
    end

    private def degree
      index = @scale.notes.index(@root).as(Int32)
      case Medley::Scale::DEGREES[@scale.mode][index]
      when "m"
        "m"
      when "d"
        "dim"
      else
        ""
      end
    end
  end
end
