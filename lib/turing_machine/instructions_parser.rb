module TuringMachine

  class InstructionsParser

    def parse(raw_instructions)
      lines = raw_instructions.split("\n")
      instructions = {}
      lines.each do |instruction|
        keys, value = instruction.split('=>')
        key1, key2 = keys.split
        write, move, next_state = value.split
        instructions[[key1, key2]] = { write: write, move: move, next_state: next_state }
      end
      instructions
    end
  end
end
