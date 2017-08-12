# Identicon

This project is from ["The Complete Elixir and Phoenix Bootcamp and Tutorial"](https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/learn/v4/overview) by Stephen Grider on www.udemy.com.  Stephen's official github repo for this
exercise is [here](https://github.com/StephenGrider/ElixirCode/tree/master/identicon)

## What's unique to this repo?

Above and beyond the course material, I added the following extensions:
1. Unit tests are added to the function comments.
1. Documentation.  Comments added to the modules and methods, and then auto-generated into HTML.


## What's an Identicon?

An identicon is 250px wide, 250px high.  It is a 5x5 grid of squares, with each square being 50px tall and 50x wide.
Some of the squares are coloured.
The pattern is symmetrically mirrored around the center column; the
two leftmost columns are a mirror of the two rightmost columns.

We want to generate an identicon based on a string input (a name).  Whenever we use the same name, we should
get the same identicon.   This way we don't need to store an image with each user, we could generate the identicon on-the-fly each time a given user logs in.

This implementation uses the [EGD (Erlang Graphical Drawer)](http://www1.erlang.org/doc/man/egd.html) library to create the Identicon images.

Here is a sample Identicon that this code produces for "justin":
![Sample Identicon](https://github.com/dawntreader/identicon/blob/master/examples/justin.png)
