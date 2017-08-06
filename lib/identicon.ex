defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  See "The Complete Elixir and Phoenix Bootcamp and Tutorial"
  by Stephen Grider on www.udemy.com

  - Take a string, and convert it to a list of 16 hex codes.
  - The first 3 numbers will form an RGB value.
    [145, 46, 200] will form a colour with Red=145, Green=46, Blue=200
  - With the 16 numbers, we will discard the last one.  That leaves us
    with 15 numbers, or 5 sets of 3.
      - Each row has 3 columns (the 4th and 5th columns are mirrors)
        and correspond to a number.  If the number is even, we will colour
        the square, if it is odd we will not colour it.
  """
  def main(input) do
    input
    |> hash_input
    |> pick_colour
    |> build_grid
  end

  @doc """

  ## Examples

    iex> Identicon.build_grid(%Identicon.Image{hex: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]})
    [[1,2,3,2,1],[4,5,6,5,4],[7,8,9,8,7],[10,11,12,11,10],[13,14,15,14,13]]
  """
  def build_grid(%Identicon.Image{hex: hex_list} = image) do
    hex_list
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)
  end

  @doc """

  ## Examples

    iex> Identicon.mirror_row([1, 2, 3])
    [1, 2, 3, 2, 1]
  """
  def mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end

  @doc """
  Return a struct that contains a list of 16 numbers (each between 0-255),
  based on the contents of the input string.   We are going to generate our
  # identicon based on this list of numbers.

  ## Parameters

    - input: String that represents a username

  ## Examples

    iex> Identicon.hash_input("asdf")
    %Identicon.Image{hex: [145, 46, 200, 3, 178, 206, 73, 228, 165, 65, 6, 141, 73, 90, 181, 112]}
  """
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  @doc """
  Grab the first 3 numbers from the hex list, and store them in the colour property.

  ## Examples

    iex> Identicon.pick_colour(%Identicon.Image{hex: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]})
    %Identicon.Image{colour: {1, 2, 3}, hex: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]}
  """
  def pick_colour(%Identicon.Image{hex: [red, green, blue| _tail]} = image) do
      # we convert colour from a list to a tuple, because each index
      # in the tuple has meaning.  1st spot is red, 2nd spot is green, etc.
      %Identicon.Image{ image | colour: {red, green, blue}}
  end



end
