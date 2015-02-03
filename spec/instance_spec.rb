require 'spec_helper'

include TuringMachine

instructions = {
  ['0', 'A'] => {write: '1', move: 'R', next_state: 'B'},
  ['1', 'A'] => {write: '1', move: 'L', next_state: 'C'},
  ['0', 'B'] => {write: '1', move: 'L', next_state: 'A'},
  ['1', 'B'] => {write: '1', move: 'R', next_state: 'B'},
  ['0', 'C'] => {write: '1', move: 'L', next_state: 'B'},
  ['1', 'C'] => {write: '1', move: 'R', next_state: 'HALT'},
}

initial_state = 'A'

describe Instance do
  it 'produces an output' do
    instance = Instance.new(instructions, initial_state)
    expected = "  1 0000000000000000000000000000000000000000 A -> 1RB\n" +
               "                       ^"
    expect(instance.to_s).to eq expected
  end

  it 'computes a step' do
    instance = Instance.new(instructions, initial_state)
    instance.proceed
    expected = "  2 0000000000000000000100000000000000000000 B -> 1LA\n" +
               "                        ^"
    expect(instance.to_s).to eq expected
  end

  describe 'null movement' do
    it 'does not move the head' do
      instructions = {
        ['0', 'A'] => {write: '1', move: 'N', next_state: 'HALT'}
      }
      instance = Instance.new(instructions, initial_state)
      instance.proceed
      expected = "  2 0000000000000000000100000000000000000000 HALT\n" +
                 "                       ^"
      expect(instance.to_s).to eq expected
    end
  end

  describe 'null write' do
    it 'does not write the current cell' do
      instructions = {
        ['0', 'A'] => {write: 'N', move: 'N', next_state: 'HALT'}
      }
      instance = Instance.new(instructions, initial_state)
      instance.proceed
      expected = "  2 0000000000000000000000000000000000000000 HALT\n" +
                 "                       ^"
      expect(instance.to_s).to eq expected

    end
  end

  context 'when halted' do

    it 'tells if the machine is halted' do
      instructions = {
        ['0', 'A'] => {write: '1', move: 'R', next_state: 'HALT'}
      }
      instance = Instance.new(instructions, initial_state)
      expect(instance.halted?).to eq false
      instance.proceed
      expect(instance.halted?).to eq true
    end

    it 'outputs especially' do
      instructions = {
        ['0', 'A'] => {write: '1', move: 'R', next_state: 'HALT'}
      }
      instance = Instance.new(instructions, initial_state)
      instance.proceed
      expected = "  2 0000000000000000000100000000000000000000 HALT\n" +
                 "                        ^"
      expect(instance.to_s).to eq expected
    end

  end

end
