module TuringMachine

  # Public: The tape of a Turing machine, combined with the head.
  class Tape

    def initialize
      @symbols = Array.new(40) { '0' }
      @index = 19
    end

    attr_reader :index

    def head
      @symbols[@index]
    end

    def head=(symbol)
      @symbols[@index] = symbol
    end

    def shift_left
      @index -= 1
    end

    def shift_right
      @index += 1
    end

    def to_s
      @symbols.join
    end
  end

end
