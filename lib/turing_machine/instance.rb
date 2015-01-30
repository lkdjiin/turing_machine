module TuringMachine

  # Public: An instance of a Turing machine.
  class Instance

    def initialize(instructions, initial_state)
      @instruction = Instruction.new(instructions)
      @state = StateRegister.new(initial_state)
      @tape = Tape.new
      @sequence = 0
    end

    def picture
      "#{@sequence} #{@tape} #{@state.current} -> #{instr_to_s}\n  " +
      ' ' * @tape.index + '^'
    end

    def proceed
      @sequence += 1
      current = @instruction.for(symbol: @tape.head, state: @state.current)
      @tape.head = current[:symbol]
      current[:move] == 'L' ? @tape.shift_left : @tape.shift_right
      @state.change(current[:next_state])
    end

    def halted?
      @state.current == 'HALT'
    end

    private

    def instr_to_s
      if halted?
        'halted'
      else
        current = @instruction.for(symbol: @tape.head, state: @state.current)
        "" + current[:symbol] + current[:move] + current[:next_state]
      end
    end
  end

end
