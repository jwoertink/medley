module Medley
  class Notes
    NOTE_NAMES = %w(A B C D E F G)
    ALIASES = {"B#": "C", "Cb": "B", "E#": "F", "Fb": "E",
               "A#": "Bb", "Bb": "A#", "C#": "Db", "Db": "C#",
               "D#": "Eb", "Eb": "D#", "F#": "Gb", "Gb": "F#"}

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

    def name
      @current_note
    end

    def halfstep_up
      if natural?
        note = "#{@current_note}#"
        return ALIASES[note]? || note
      elsif sharp?
        idx = NOTE_NAMES.index(@current_note[0].to_s) || -1
        return NOTE_NAMES[idx + 1]? || NOTE_NAMES[0]
      elsif flat?
        @current_note[0].to_s
      else
        return NOTE_NAMES[0]
      end
    end

    def wholestep_up
      new_note = Medley::Notes.new(halfstep_up)
      new_note.halfstep_up
    end
  end
end
