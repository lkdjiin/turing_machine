module TuringMachine

  # Public: The tape of a Turing machine, combined with the head.
  class Tape

    BLANK_SYMBOL = '0'

    def initialize(data = BLANK_SYMBOL)
      @symbols = data.scan(/./)
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
        @symbols.unshift(BLANK_SYMBOL)
      else
        @index -= 1
      end
    end

    # Public: Move the head to the right.
    def shift_right
      @symbols.push(BLANK_SYMBOL) if @index == @symbols.size - 1
      @index += 1
    end

    def to_s
      @symbols.join
    end
  end

end
