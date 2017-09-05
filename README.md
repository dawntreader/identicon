# Identicon

This project is from ["The Complete Elixir and Phoenix Bootcamp and Tutorial"](https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/learn/v4/overview) by Stephen Grider on www.udemy.com.  Stephen's official github repo for this
exercise is [here](https://github.com/StephenGrider/ElixirCode/tree/master/identicon).

## What's unique to this repo?

To play with the code a bit, I made some enhancements to the solution from the course.
1. The default course material generated an identicon whereby the total image size was
2500x2500, with the top-left 250x250 pixels containing the identicon.
I added a method ''crop_image'' that crops out the 250x250 pixels starting at the
top-left corner.  This was done using the [Graphics Magick](http://www.graphicsmagick.org)
library and [exmagick](https://github.com/Xerpa/exmagick).
1. Documentation.  Comments added to the modules and methods.  Mix file includes generation of HTML documentation.  Run: ``mix docs``
1. Added unit tests via [function comments](https://github.com/justingamble/identicon/blob/master/lib/identicon.ex)  and [identicon_test.exs](https://github.com/justingamble/identicon/blob/master/test/identicon_test.exs)
1. Added type specifications to the functions.  Mix file includes Dialyzer module.  Run: ``mix compile; mix dialyzer``

## What's an Identicon?

An Identicon is a 5x5 grid of squares, with some of the squares coloured.
The pattern and the colour is selected based on the input string.
The Identicon image is 250px wide, 250px high.  Each of the grid squares
is 50x wide, 50px high.

The pattern is symmetrically mirrored around the center column; the
two leftmost columns are a mirror of the two rightmost columns.

Whenever we use the same input string, we should get the same identicon.
This way we don't need to store an image with each user, we could generate
the identicon on-the-fly each time a given user logs in.

Here is a sample Identicon that this code produces for "justin":  

![Sample Identicon](https://github.com/justingamble/identicon/blob/master/examples/justin.png)

## Sample Usage

```
$ iex -S mix
iex> Identicon.main("justin")
```

