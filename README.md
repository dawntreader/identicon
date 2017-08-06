# Identicon

This project is from 'The Complete ELixir and Phoenix Bootcamp and Tutorial" by Steven Grider on udemy.com.

An identicon is 250px wide, 250px high.  It is a 5x5 grid of squares, with each being 50px tall and wide.
Some of the squares are coloured.
The pattern is symmetrically mirrored around the center vertical column (so the left side is a mirror of the right side).

We want to generate an identicon based on a string input (a name).  Whenever we use the same name, we should
get the same identicon.   For example, we don't need to store an image with each user, we could generate the identicon on the fly each time the user logs in.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `identicon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:identicon, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/identicon](https://hexdocs.pm/identicon).

