require 'spec_helper'

include TuringMachine

describe Tape do

  let(:tape) { Tape.new }

  describe '.new' do

    it 'has a initial current symbol of "0"' do
      expect(tape.head).to eq '0'
    end

  end

  describe '#head=' do

    it 'writes to the tape' do
      tape.head = '1'
      expect(tape.head).to eq '1'
    end

  end

  describe 'moves' do

    it 'moves to the cell to the left' do
      tape.head = '1'
      tape.shift_left
      expect(tape.head).to eq '0'
    end

    it 'moves to the cell to the right' do
      tape.head = '1'
      tape.shift_right
      expect(tape.head).to eq '0'
    end

  end

  it 'has a string representation' do
    expect("#{tape}").to eq '0000000000'
  end

end
