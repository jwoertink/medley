module Medley
  class Scale
    PATTERNS = {
      "maj":        %w(W W H W W W H), # aka ionian
      "min":        %w(W H W W H W W), # aka aeolian
      "ionian":     %w(W W H W W W H), # aka major
      "dorian":     %w(W H W W W H W),
      "phrygian":   %w(H W W W H W W),
      "lydian":     %w(W W W H W W H),
      "mixolydian": %w(W W H W W H W),
      "aeolian":    %w(W H W W H W W), # aka minor
      "locrian":    %w(H W W H W W W),
    }

    DEGREES = {
      "maj":        %w(M m m M D m d), # aka ionian
      "min":        %w(m d M m m M M), # aka aeolian
      "ionian":     %w(M m m M D m d), # aka major
      "dorian":     %w(m m M M m d M),
      "phrygian":   %w(m M M m d M m),
      "lydian":     %w(M M m d M m m),
      "mixolydian": %w(M m d M m m M),
      "aeolian":    %w(m d M m m M M), # aka minor
      "locrian":    %w(d M m m M M m),
    }

    getter :name
    getter :mode

    @pattern : Array(String)
    @root : String

    def initialize(scale : String)
      @name = scale
      scale.match(/(\w+)(#{PATTERNS.keys.join("|")})/)
      @mode = $2.downcase.as(String)
      @pattern = PATTERNS[$2.downcase]
      @root = $1
      @notes = [] of String
      build_scale
    end

    def to_s(io)
      io << "#{@name} (#{@notes.join(" ")})"
    end

    def notes
      @notes
    end

    def key
      Medley::Key.new(self)
    end

    def chords
      @notes.to_set.map do |note|
        Medley::Chord.new(self, note)
      end
    end

    def chord_for(note : String)
      Medley::Chord.new(self, note)
    end

    def pattern(*values : Int32)
      raise Medley::InvalidPatternError.new("Note arrays are not 0 based index") if values.includes?(0)
      results = [] of String
      values.each do |v|
        v = v % 7 if v > 7
        results << notes[v - 1]
      end
      results
    end

    private def build_scale
      note = Medley::Note.new(@root)
      @notes << note.name
      @pattern.each do |step|
        new_note = case step
        when "W"
          Medley::Note.new(note.wholestep_up)
        when "H"
          Medley::Note.new(note.halfstep_up)
        else Medley::Note.new("C")
        end
        if new_note.root_matches?(note)
          new_note = Medley::Note.new(Medley::Note::ALIASES[new_note.name])
        end
        @notes << new_note.name
        note = Medley::Note.new(@notes.last)
      end
    end
  end
end
