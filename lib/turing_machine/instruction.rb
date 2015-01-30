module TuringMachine

  class Instruction

    def initialize(table)
      @table = table
    end

    def for(symbol:, state:)
      @table[{symbol: symbol, state: state}]
    end

  end
end
