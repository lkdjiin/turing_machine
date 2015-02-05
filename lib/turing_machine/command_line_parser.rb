require 'optparse'
require 'ostruct'

module TuringMachine

  class CommandLineParser

    def initialize(args)
      @args = args
      @options = OpenStruct.new
      @options.tape = '0'

      @opt_parser = OptionParser.new do |opts|
        opts.banner = "Usage: turing_machine instruction_set [options]"

        opts.on("-t", "--tape DATA", "Initialize the tape with DATA") do |data|
          @options.tape = data
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

        opts.on_tail("--version", "Show version") do
          puts VERSION
          exit
        end
      end
    end

    def parse
      @opt_parser.parse!(@args)
      @options
    end

    def help
      @opt_parser.help
    end

  end

end
