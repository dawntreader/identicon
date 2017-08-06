# Identicon

This project is from 'The Complete Elixir and Phoenix Bootcamp and Tutorial" by Steven Grider on www.udemy.com.

An identicon is 250px wide, 250px high.  It is a 5x5 grid of squares, with each square being 50px tall and 50x wide.
Some of the squares are coloured.
The pattern is symmetrically mirrored around the center column; the
two leftmost columns are a mirror of the two rightmost columns.

We want to generate an identicon based on a string input (a name).  Whenever we use the same name, we should
get the same identicon.   For example, we don't need to store an image with each user, we could generate the identicon on the fly each time aa given user logs in.
