module Medley
  class Scale
    PATTERNS = {
      "maj": %w(1 1 .5 1 1 1 .5),
      "min": %w(1 .5 1 1 .5 1 1)
    }

    getter :name

    @pattern : Array(String)
    @root : String

    def initialize(scale : String)
      @name = scale
      scale.match(/(\w+)(maj|min)/)
      @pattern = PATTERNS[$2]
      @root = $1
      @notes = [] of String
      build_scale
    end

    def notes
      @notes
    end

    def key
      Medley::Key.new(self)
    end

    private def build_scale
      note = Medley::Note.new(@root)
      @notes << note.name
      @pattern.each do |step|
        new_note = case step
        when "1"
          Medley::Note.new(note.wholestep_up)
        when ".5"
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
