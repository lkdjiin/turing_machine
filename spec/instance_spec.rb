require 'spec_helper'

include TuringMachine

instructions = {
  {symbol: '0', state: 'A'} => {symbol: '1', move: 'R', next_state: 'B'},
  {symbol: '1', state: 'A'} => {symbol: '1', move: 'L', next_state: 'C'},
  {symbol: '0', state: 'B'} => {symbol: '1', move: 'L', next_state: 'A'},
  {symbol: '1', state: 'B'} => {symbol: '1', move: 'R', next_state: 'B'},
  {symbol: '0', state: 'C'} => {symbol: '1', move: 'L', next_state: 'B'},
  {symbol: '1', state: 'C'} => {symbol: '1', move: 'R', next_state: 'HALT'},
}

initial_state = 'A'

describe Instance do
  it 'produces an output' do
    instance = Instance.new(instructions, initial_state)
    expected = "1 0000000000 A -> 1RB\n" +
               "      ^"
    expect(instance.picture).to eq expected
  end

  it 'computes a step' do
    instance = Instance.new(instructions, initial_state)
    instance.proceed
    expected = "2 0000100000 B -> 1LA\n" +
               "       ^"
    expect(instance.picture).to eq expected
  end

  context 'when halted' do

    it 'tells if the machine is halted' do
      instructions = {
        {symbol: '0', state: 'A'} => {symbol: '1', move: 'R', next_state: 'HALT'}
      }
      instance = Instance.new(instructions, initial_state)
      expect(instance.halted?).to eq false
      instance.proceed
      expect(instance.halted?).to eq true
    end

    it 'outputs especially' do
      instructions = {
        {symbol: '0', state: 'A'} => {symbol: '1', move: 'R', next_state: 'HALT'}
      }
      instance = Instance.new(instructions, initial_state)
      instance.proceed
      expected = "2 0000100000 HALT\n" +
                 "       ^"
      expect(instance.picture).to eq expected
    end

  end

end
