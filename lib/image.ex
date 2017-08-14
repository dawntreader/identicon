defmodule Identicon.Image do
  @moduledoc """
  Structure to hold the data bits related to creating an Identicon.
  We pass this structure through all the steps of the main() routine;
  each steps modifies or appends something to this struct.

  - hex: a list of 16 hexidecimal numbers
  - colour: an RGB defining a colour
  - grid: a list representing a 5x5 square, where each entry is a tuple
    containing a number (0-255) and an index (0-24).
  - pixel_map: for each grid square that we want to colour, the pixel_map
    will contain a pair of points that we will later use to draw a rectangle.
    Each pair of points gives the top-left and bottom-right (x,y) coordinates
    for a rectangle that will be drawn.
  """
  defstruct  hex: nil, colour: nil, grid: nil, pixel_map: nil
end
