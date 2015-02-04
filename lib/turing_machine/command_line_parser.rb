require 'optparse'
require 'ostruct'

module TuringMachine

  class CommandLineParser

    def self.parse(args)
      options = OpenStruct.new
      options.tape = '0'

      opt_parser = OptionParser.new do |opts|
        opts.on("-t", "--tape DATA", "Initialize the tape with DATA") do |data|
          options.tape = data
        end
      end

      opt_parser.parse!(args)
      options
    end

  end

end
