module Medley
  class Chord
    def initialize(scale : Scale, root : String)
      @scale = scale
      @root = root
      @notes = [] of String
      build_chord(1, 3, 5)
    end

    def to_s(io)
      io << "#{@root} (#{@notes.join(" ")})"
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
  end
end
