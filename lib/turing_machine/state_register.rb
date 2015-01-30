module TuringMachine

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

  end

end
