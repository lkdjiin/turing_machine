TuringMachine
=============

> A man provided with paper, pencil, and rubber, and subject to strict discipline, is in effect a universal machine.
> — Alan Turing

![Photo of Alan Turing](alan-turing2.jpg)

A Turing machine that can run (almost) (one day maybe) (I hope) any instruction set.

## Installation

Install it with:

    $ gem install turing_machine

## Usage

Look at some well-known instruction sets in [instruction_sets](instruction_sets)
or create your own. Then run the Turing machine with, for example:

    $ turing_machine instruction_sets/busy_beaver_1

To initialize the tape with some data, use `--tape`:

    $ turing_machine instruction_sets/copy --tape 111

Finally, look at the
[InstructionsParser class](lib/turing_machine/instructions_parser.rb) for a
documentation of the instruction format if you want to write your own.

## Contributing

1. Fork it ( https://github.com/lkdjiin/turing_machine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT, see LICENSE.TXT

## Questions and/or Comments

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions, or contact me on [twitter](https://twitter.com/lkdjiin).
