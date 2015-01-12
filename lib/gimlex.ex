defmodule Gimlex do
  def parse_content(data) do
    data
    |> String.split("\n", trim: true)
    |> parse_string([])
  end

  defp parse_string([head|tail], acc) do
    [parse_value(parse_type(head), tail) | acc]
  end

  defp parse_type(<<":num:", rest::binary>>) do
    name = rest
    |> String.split
    |> List.first
    {:num, name}
  end

  defp parse_type(<<":text:", rest::binary>>) do
    name = rest
    |> String.split
    |> List.first
    {:text, name}
  end

  defp parse_value({:num, name}, [head|tail]) do
    {name, parse_num(head)}
  end

  defp parse_value({:text, name}, [head|tail]) do
    {name, parse_text(head)}
  end

  defp parse_num(num) do
    case String.contains?(num, ".") do
      false -> String.to_integer(num)
      true -> String.to_float(num)
    end
  end

  defp parse_text(str) do
    str
  end
end
