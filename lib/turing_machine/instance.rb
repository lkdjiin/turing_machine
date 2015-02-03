module TuringMachine

  # Public: An instance of a Turing machine.
  class Instance

    def initialize(instructions, initial_state)
      @instructions = Instructions.new(instructions)
      @state = StateRegister.new(initial_state)
      @tape = Tape.new
      @sequence = 1
    end

    def to_s
      "#{'%3d' % @sequence} #{@tape} #{@state}#{instr_to_s}\n    " +
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
      @tape.head = current_action[:write] unless current_action[:write] == 'N'
      @tape.shift_left if current_action[:move] == 'L'
      @tape.shift_right if current_action[:move] == 'R'
    end

    def update_state(current_action)
      @state.change(current_action[:next_state])
    end

    def action
      @instructions.get(@tape.head, @state.current)
    end

    def instr_to_s
      if halted?
        ''
      else
        " -> " + action[:write] + action[:move] + action[:next_state]
      end
    end
  end

end
