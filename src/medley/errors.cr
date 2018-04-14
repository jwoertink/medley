module Medley
  class InvalidPatternError < Exception
    def initialize(message)
      super(message)
    end
  end
end
