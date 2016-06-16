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
        new_note = case step
        when "1"
          note.wholestep_up
        when ".5"
          note.halfstep_up
        else
          ""
        end
        # TODO: find a better way to handle this
        # need to do this because if the scale has A and A#, the A# should be Bb
        #if @notes.select { |n| n[0].to_s == new_note[0].to_s }.any?
        #  new_note = Medley::Notes::ALIASES[new_note]
        #end
        @notes << new_note
        note = Medley::Notes.new(@notes.last)
      end
    end
  end
end
