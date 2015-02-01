module TuringMachine

  # Public: Parser for a newline separated instruction set.
  #
  # Instruction format
  # ------------------
  #
  # Here is an example file with four instructions :
  #
  # ```
  # 0 A => 1 R B
  # 1 A => 1 L B
  # 0 B => 1 L A
  # 1 B => 1 R HALT
  # ```
  #
  # So each instruction is :
  #
  # scanned-symbol  current-state  =>  symbol-to-write  move  next-state
  class InstructionsParser

    def initialize(raw_instructions)
      @lines = raw_instructions.split("\n")
      @instructions = {}
    end

    def parse
      build_instructions
      @instructions
    end

    private

    def build_instructions
      @lines.each do |instruction|
        keys, value = instruction.split('=>')
        key_symbol, key_state = keys.split
        write, move, next_state = value.split
        @instructions[[key_symbol, key_state]] = {
          write: write, move: move, next_state: next_state
        }
      end
    end

  end

end
