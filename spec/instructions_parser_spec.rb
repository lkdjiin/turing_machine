require 'spec_helper'

include TuringMachine

describe InstructionsParser do

  let(:busy_beaver_1) { "0 A => 1 R HALT" }

  let(:busy_beaver_2) do
    "0 A => 1 R B\n1 A => 1 L B\n0 B => 1 L A\n1 B => 1 R HALT"
  end

  describe '#parse' do
    it 'returns Instruction' do
      parser = InstructionsParser.new(busy_beaver_1)
      value = parser.parse
      expect(value).to be_a Hash
    end
  end

  context 'when parsing busy beaver 1 state' do
    it 'parses the single instruction' do
      parser = InstructionsParser.new(busy_beaver_1)
      value = parser.parse
      expected = {write: '1', move: 'R', next_state: 'HALT'}
      expect(value[['0', 'A']]).to eq expected
    end
  end

  context 'when parsing busy beaver 2 states' do
    it 'parses all four instructions' do
      parser = InstructionsParser.new(busy_beaver_2)
      value = parser.parse
      expected = {write: '1', move: 'R', next_state: 'HALT'}
      expect(value[['1', 'B']]).to eq expected
    end
  end

end
