module TuringMachine

  # Public: The state register of a Turing machine.
  class StateRegister

    def initialize(state)
      @state = state
    end

    def current
      @state
    end

    def change(new_state)
      @state = new_state
    end

    def to_s
      @state.to_s
    end
  end

end
