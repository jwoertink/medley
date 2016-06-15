# medley

A mixture of music related methods.

## Installation

Install locally

* `git clone git@github.com:jwoertink/medley.git`
* `cd medley/`
* `crystal deps` ? I'm stll not sure how all this works yet

or add as a dependecy to your project

```yaml
dependencies:
  medley:
    github: jwoertink/medley
```

## Usage

```crystal
require "medley"

# List out a scale
scale = Medley::Scales.new('Cmaj') 
scale.notes #=> ["C", "D", "E", "F", "G", "A", "B", "C"]

# Play with a note
note = Medley::Notes.new("G")
puts note.halfstep_up # => G#
puts note.wholestep_up # => A
puts note.sharp? #=> false
```

## Development

* `crystal spec`

## Contributing

1. Fork it ( https://github.com/jwoertink/medley/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [jwoertink](https://github.com/jwoertink) Jeremy Woertink - creator, maintainer
