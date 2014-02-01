# rudge 
determines sentences in a text.

## Installation
     gem install rudge

## Example
    require 'rudge'

    Rudge.sentences("Here's to the crazy ones. The misfits. The rebels. The troublemakers.
                     The round pegs in the square holes. The ones who see things differently.")

    # => ["Here's to the crazy ones.", "The misfits.", "The rebels.", "The troublemakers.", 
          "The round pegs in the square holes.", "The ones who see things differently."]

## Documentation
based on the work available here: http://www.pressure.to/ruby/
