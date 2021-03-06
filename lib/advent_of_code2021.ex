defmodule AdventOfCode2021 do
  @moduledoc """
  Documentation for `AdventOfCode2021`.
  """

  defmacro __using__(options) do
    quote do
      import AdventOfCode2021

      @doc """
      Inspired by https://github.com/scmx/advent-of-code-2020-elixir
      """
      def puzzle_input do
        read_puzzle_input_for(__MODULE__, unquote(options))
      end
    end
  end

  @doc false
  def read_puzzle_input_for(module, options) when is_atom(module) do
    module
    |> input_filename
    |> read_puzzle_input_for(options)
  end

  def read_puzzle_input_for(filename, options) when is_binary(filename) do
    case File.read(Path.join(["input", filename <> ".txt"])) do
      {:ok, data} -> trim(data, Keyword.get(options, :trim))
      {:error, _} -> nil
    end
  end

  defp input_filename(module) do
    module
    |> to_string()
    |> String.split(".")
    |> Enum.at(2)
    |> Macro.underscore()
    |> String.replace(~r/(\w)(\d)/, "\\1_\\2")
  end

  defp trim(text, false), do: String.trim_trailing(text, "\n")
  defp trim(text, _), do: String.trim(text)
end
