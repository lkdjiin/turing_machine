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

    specify do
      tape.shift_left
      tape.shift_right
      tape.shift_left
      expect("#{tape}").to eq '00'
    end

  end

  describe 'string representation' do

    context 'default initialization' do
      it 'has a representation' do
        expect("#{tape}").to eq '0'
      end
    end

    context 'after left move' do
      it 'has a representation' do
        tape.head = '1'
        tape.shift_left
        expect("#{tape}").to eq '01'
      end
    end

    context 'after right move' do
      it 'has a representation' do
        tape.head = '1'
        tape.shift_right
        expect("#{tape}").to eq '10'
      end
    end

  end

end
