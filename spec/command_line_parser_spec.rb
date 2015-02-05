require 'spec_helper'

include TuringMachine

describe CommandLineParser do

  it 'parses -t' do
    cli_parser = CommandLineParser.new %w( -t 11011 )
    options = cli_parser.parse
    expect(options.tape).to eq '11011'
  end

  it 'parses --tape' do
    cli_parser = CommandLineParser.new %w( --tape 101 )
    options = cli_parser.parse
    expect(options.tape).to eq '101'
  end

  specify 'tape default value' do
    cli_parser = CommandLineParser.new []
    options = cli_parser.parse
    expect(options.tape).to eq '0'
  end

end
