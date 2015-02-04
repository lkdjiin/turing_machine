require 'spec_helper'

include TuringMachine

describe CommandLineParser do

  it 'parses -t' do
    options = CommandLineParser.parse %w( -t 11011 )
    expect(options.tape).to eq '11011'
  end

  it 'parses --tape' do
    options = CommandLineParser.parse %w( --tape 101 )
    expect(options.tape).to eq '101'
  end

  specify 'tape default value' do
    options = CommandLineParser.parse []
    expect(options.tape).to eq '0'
  end

end
