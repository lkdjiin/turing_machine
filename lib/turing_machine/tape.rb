module TuringMachine

  # Public: The tape of a Turing machine, combined with the head.
  class Tape

    def initialize
      @symbols = [ '0' ]
      @index = 0
    end

    attr_reader :index

    def head
      @symbols[@index]
    end

    def head=(symbol)
      @symbols[@index] = symbol
    end

    # Public: Move the head to the left.
    def shift_left
      if @index == 0
        @symbols.unshift('0')
      else
        @index -= 1
      end
    end

    # Public: Move the head to the right.
    def shift_right
      @symbols.push('0') if @index == @symbols.size - 1
      @index += 1
    end

    def to_s
      @symbols.join
    end
  end

end
