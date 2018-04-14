# medley

A mixture of music related methods.

## Installation

Install locally

* `git clone git@github.com:jwoertink/medley.git`
* `cd medley/`
* `icr -r ./src/medley.cr`

or add as a dependecy to your project

```yaml
dependencies:
  medley:
    github: jwoertink/medley
    branch: master
```

## Usage

```crystal
require "medley"

# Play with a note
note = Medley::Note.new("G")
puts note.halfstep_up # => "G#"
puts note.wholestep_up # => "A"
puts note.sharp? #=> false
puts note.natural? #=> true
puts note.next_root #=> "A"
puts note.halfstep_down #=> "Gb"
puts note.name #=> "G"

other_note = Medley::Note.new("G#")
other_note.root_matches?(note) #=> true

# Play with a scale
scale = Medley::Scale.new("Cmaj")
scale.notes #=> ["C", "D", "E", "F", "G", "A", "B", "C"]

# Get the flats or sharps from a key of a scale
scale = Medley::Scale.new("Bbmaj")
scale.key.flats #=> ["Bb", "Eb"]

# Learn note patterns from a scale
scale = Medley::Scale.new("Cmaj")
scale.pattern(1, 6, 4, 5) #=> ["C", "A", "F", "G"]
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
