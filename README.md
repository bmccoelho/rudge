# rudge [![Gem Version](https://badge.fury.io/rb/rudge.png)](http://badge.fury.io/rb/rudge)
determines sentences in a text.

## Installation
     gem install rudge

## Options
passing ```keep_trailling_whitespace: true``` to Rudge will allow to keep the whitespaces ant the end of each sentence

## Example
    require 'rudge'

    Rudge.sentences("Here's to the crazy ones. The misfits. The rebels. The troublemakers.
                     The round pegs in the square holes. The ones who see things differently.")

    # => ["Here's to the crazy ones.", "The misfits.", "The rebels.", "The troublemakers.",
          "The round pegs in the square holes.", "The ones who see things differently."]

    Rudge.sentences("First sentence, Mr. Frodo.   Second sentence.", keep_trailling_whitespace: true)

    # => ["First sentence, Mr. Frodo.   ", "Second sentence."]

## Documentation
based on the work available here: http://www.pressure.to/ruby/

## License

Rudge is released under the [MIT License](http://www.opensource.org/licenses/MIT).
