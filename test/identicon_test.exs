defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  defp delete_output_images() do
    ["Image1.png", "Image1.bak", "Image2.png", "Image2.bak", "Image3.png", "Image3.bak"]
    |> Enum.each( &File.rm/1 )

    verify_output_images_do_not_exist()
  end

  defp verify_output_images_do_not_exist() do
    ["Image1.png", "Image1.bak", "Image2.png", "Image2.bak",  "Image3.png", "Image3.bak"]
    |> Enum.each( &verify_file_does_not_exist(&1) )
  end

  defp verify_file_does_not_exist(filename) do
    refute File.exists? filename
  end

  defp verify_file_exists(filename) do
    assert File.exists? filename
  end

  defp verify_files_differ(filename1, filename2) do
    assert System.cmd("diff", [filename1, filename2]) == {"Binary files #{filename1} and #{filename2} differ\n", 2}
  end

  defp verify_files_are_same(filename1, filename2) do
    assert System.cmd("diff", [filename1, filename2]) == {"", 0}
  end

  defp change_suffix_to_bak(base) do
    :ok = File.rename("#{base}.png", "#{base}.bak")
  end

  setup do
    delete_output_images()
    on_exit(&delete_output_images/0)
  end

  test "two different input strings will produce different identicons" do
    ["Image1", "Image2", "Image3"]
    |> Enum.each( &Identicon.main/1 )

    ["Image1.png", "Image2.png", "Image3.png"]
    |> Enum.each( &verify_file_exists/1 )

    verify_files_differ("Image1.png", "Image2.png")
    verify_files_differ("Image2.png", "Image3.png")
    verify_files_differ("Image1.png", "Image3.png")
  end

  test "the same input string again will produce the same identicon" do
    ["Image1", "Image2", "Image3"]
    |> Enum.each( &Identicon.main/1 )

    ["Image1", "Image2", "Image3"]
    |> Enum.each( &change_suffix_to_bak(&1) )

    ["Image1", "Image2", "Image3"]
    |> Enum.each( &Identicon.main/1 )

    verify_files_are_same("Image1.png", "Image1.bak")
    verify_files_are_same("Image2.png", "Image2.bak")
    verify_files_are_same("Image3.png", "Image3.bak")
  end
end
