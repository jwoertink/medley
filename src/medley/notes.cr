module Medley
  class Notes
    NOTE_NAMES = %w(A B C D E F G)
    ALIASES = {"B#": "C", "Cb": "B", "E#": "F", "Fb": "E"}

    # 1 1 .5 1 1 1 .5
    def self.by_scale(scale : String)
      scale.match(/(\w+)(maj|min)/)

    end

    def initialize(current_note : String)
      @current_note = current_note
    end

    def natural?
      NOTE_NAMES.includes?(@current_note)
    end

    def flat?
      @current_note.includes?("b")
    end

    def sharp?
      @current_note.includes?("#")
    end

    def halfstep_up
      if natural?
        note = "#{@current_note}#"
        return ALIASES[note]? || note
      elsif sharp?
        idx = NOTE_NAMES.index(@current_note[0])
        NOTE_NAMES[idx + 1]? || NOTE_NAMES[0]
      end
    end
  end
end
