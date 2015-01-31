require 'spec_helper'

include TuringMachine

describe Instruction do

  let(:instruction) do
    Instruction.new({
      ['0', 'A'] => {symbol: '1', move: 'R', next_state: 'B'},
      ['1', 'A'] => {symbol: '1', move: 'L', next_state: 'C'},
    })
  end

  it 'finds actions' do
    hash = instruction.for('0', 'A')
    expect(hash[:symbol]).to eq '1'
    expect(hash[:move]).to eq 'R'
    expect(hash[:next_state]).to eq 'B'
  end

end
