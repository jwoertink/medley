module Medley
  class Scales
    PATTERNS = {
      "maj": %w(1 1 .5 1 1 1 .5),
      "min": %w(1 .5 1 1 .5 1 1)
    }

    @pattern : Array(String)
    @root : String

    def initialize(scale : String)
      scale.match(/(\w+)(maj|min)/)
      @pattern = PATTERNS[$2]
      @root = $1
      @notes = [] of String
      build_scale
    end

    def notes
      @notes
    end

    private def build_scale
      note = Medley::Notes.new(@root)
      @notes << note.name
      @pattern.each do |step|
        case step
        when "1"
          @notes << note.wholestep_up
        when ".5"
          @notes << note.halfstep_up
        end
        note = Medley::Notes.new(@notes.last)
      end
    end
  end
end
