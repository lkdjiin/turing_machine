require 'spec_helper'

include TuringMachine

describe StateRegister do

  let(:state) { StateRegister.new('A') }

  it 'has a current starting state' do
    expect(state.current).to eq 'A'
  end

  it 'has a string representation' do
    expect("#{state}").to eq 'A'
  end

  it 'could change the state' do
    state.change('B')
    expect(state.current).to eq 'B'
  end

end
