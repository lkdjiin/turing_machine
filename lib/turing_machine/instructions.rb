module TuringMachine

  # Public: The instruction table of a Turing machine.
  class Instructions

    def initialize(table)
      @table = table
    end

    def get(symbol, state)
      @table[[symbol, state]]
    end

  end
end
