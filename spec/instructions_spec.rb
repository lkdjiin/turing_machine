require 'spec_helper'

include TuringMachine

describe Instructions do

  let(:instructions) do
    Instructions.new({
      ['0', 'A'] => {write: '1', move: 'R', next_state: 'B'},
      ['1', 'A'] => {write: '1', move: 'L', next_state: 'C'},
    })
  end

  it 'finds actions' do
    hash = instructions.get('0', 'A')
    expect(hash[:write]).to eq '1'
    expect(hash[:move]).to eq 'R'
    expect(hash[:next_state]).to eq 'B'
  end

end
