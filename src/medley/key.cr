module Medley
  class Key

    def initialize(scale : Scale)
      @scale = scale  
    end
    
    # returns an array of flat notes in a key
    def flats
      @scale.notes.select { |n| 
        note = Note.new(n)
        note.flat? || note.double_flat?
      }.uniq
    end
    
    # returns an array of the sharp notes in a key
    def sharps
      @scale.notes.select { |n|
        note = Note.new(n)
        note.sharp? || note.double_sharp?
      }.uniq
    end

    def name
      @scale.name
    end
  end
end
