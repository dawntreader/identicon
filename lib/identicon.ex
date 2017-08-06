defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  See "The Complete Elixir and Phoenix Bootcamp and Tutorial"
  by Stephen Grider on www.udemy.com

  ## Examples

      iex> Identicon.hello
      :world

  """
  def main(input) do
    input
    |> hash_input
  end

  # output: a list of 16 numbers (each between 0-255), based on the contents of the string
  # We are going to generate our identicon based on this list of numbers.
  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end

  # each set of 3 numbers will form an RGB value.
  # [145, 46, 200] will form a colour with Red=145, Green=46, Blue=200

  # with the 16 numbers, we will discard the last one.  That leaves us
  # with 15 numbers, or 5 sets of 3.
  # Each row has 3 columsn (the 4th and 5th columns are mirrors)
  # and correspond to a number.  If the number is even, we will colour
  # the square, if it is odd we will not colour it.

end
