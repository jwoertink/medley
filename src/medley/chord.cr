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
      notes = @scale.notes
      notes.pop
      # TODO: Use a different method to loop back around
      notes = notes + notes

      root_index = notes.index(@root).as(Int32)
      pattern.each do |i|
        @notes << notes[root_index + (i - 1)]
      end
    end
  end
end
