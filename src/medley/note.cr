module Medley
  class Note
    NOTE_NAMES = %w(A B C D E F G)
    ALIASES = {"A##": "B", "B##": "C#", "C##": "D", "D##": "E", 
               "E##": "F#", "F##": "G", "G##": "A", "Abb": "G",
               "Bbb": "A", "Cbb": "Bb", "Dbb": "C", "Ebb": "D",
               "Fbb": "Eb", "Gbb": "F", "A#": "Bb", "B#": "C",
               "C#": "Db", "D#": "Eb", "E#": "F", "F#": "G",
               "G#": "Ab"}
              
    def initialize(current_note : String)
      @current_note = current_note
    end

    # true if it's a valid note letter with no modifiers
    def natural?
      !!name.match(/\A[A-G]\Z/)
    end

    # true if it's a valid note letter with b
    def flat?
      !!name.match(/\A[A-G]b\Z/)
    end

    # true if it's a valid note letter with bb
    def double_flat?
      !!name.match(/\A[A-G]bb\Z/)
    end

    # true if it's a valid note letter with #
    def sharp?
      !!name.match(/\A[A-G]#\Z/)
    end

    # true if it's a valid note letter with ##
    def double_sharp?
      !!name.match(/\A[A-G]##\Z/)
    end

    # Returns the current note name
    def name
      @current_note
    end
    
    # Returns the root of the note
    def root
      @current_note[0].to_s
    end

    def next_root
      idx = NOTE_NAMES.index(root) || -1
      NOTE_NAMES[idx + 1]
    end
    
    # true if the root name is equal to the other note root
    def root_matches?(other_note : Note)
      root == other_note.root
    end
    
    # Returns the same note, but up a halfstep in most cases
    # Without context of the Key, there's no telling if
    # the note E should be E# or F. Since there's no triple sharps,
    # this is the only case we just go to the next note.
    def halfstep_up
      case self
      when .natural?, .sharp?
        return "#{@current_note}#"
      when .flat?
        return @current_note[0].to_s
      when .double_flat?
        @current_note[0..1].to_s
      when .double_sharp?
        aliased = ALIASES[@current_note]
        return "#{aliased}#"
      else ""
      end
    end

    def halfstep_down
      case self
      when .natural?, .flat?
        return "#{@current_note}b"
      when .sharp?
        return @current_note[0].to_s
      when .double_sharp?
        @current_note[0..1].to_s
      when .double_flat?
        aliased = ALIASES[@current_note]
        return "#{aliased}b"
      else ""
      end
    end

    def wholestep_up
      up_halfstep = Note.new(halfstep_up)
      new_note = Note.new(up_halfstep.halfstep_up)
      if new_note.double_sharp?
        ALIASES[new_note.name]
      elsif new_note.root_matches?(self)
        new_note.next_root + name[1..-1]
      else
        new_note.name
      end
    end
  end
end
