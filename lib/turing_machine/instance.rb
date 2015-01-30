module TuringMachine

  # Public: An instance of a Turing machine.
  class Instance

    def initialize(instructions, initial_state)
      @instruction = Instruction.new(instructions)
      @state = StateRegister.new(initial_state)
      @tape = Tape.new
      @sequence = 1
    end

    def picture
      "#{@sequence} #{@tape} #{@state.current}#{instr_to_s}\n  " +
      ' ' * @tape.index + '^'
    end

    def proceed
      current = action
      update_sequence
      update_tape(current)
      update_state(current)
    end

    def halted?
      @state.current == 'HALT'
    end

    private

    def update_sequence
      @sequence += 1
    end

    def update_tape(current_action)
      @tape.head = current_action[:symbol]
      current_action[:move] == 'L' ? @tape.shift_left : @tape.shift_right
    end

    def update_state(current_action)
      @state.change(current_action[:next_state])
    end

    def action
      @instruction.for(symbol: @tape.head, state: @state.current)
    end

    def instr_to_s
      if halted?
        ''
      else
        " -> " + action[:symbol] + action[:move] + action[:next_state]
      end
    end
  end

end
