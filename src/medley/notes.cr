module Medley
  class Notes
    NOTE_NAMES = %w(A B C D E F G)

    def self.by_scale(scale : String)
      ["C", "D", "E", "F", "G", "A", "B", "C"]
    end
  end
end
