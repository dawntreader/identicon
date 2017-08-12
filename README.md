# Identicon

This project is from "The Complete Elixir and Phoenix Bootcamp and Tutorial" by Stephen Grider on www.udemy.com.

## What's special?

Above and beyond the course material, I added the following extensions:
1. Documentation.  Comments added to the modules and methods, and then auto-generated into HTML.
2. Tests.  Tests added to the function comments.

## What's an Identicon?

An identicon is 250px wide, 250px high.  It is a 5x5 grid of squares, with each square being 50px tall and 50x wide.
Some of the squares are coloured.
The pattern is symmetrically mirrored around the center column; the
two leftmost columns are a mirror of the two rightmost columns.

We want to generate an identicon based on a string input (a name).  Whenever we use the same name, we should
get the same identicon.   This way we don't need to store an image with each user, we could generate the identicon on-the-fly each time a given user logs in.
