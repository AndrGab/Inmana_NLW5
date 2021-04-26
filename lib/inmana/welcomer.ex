defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> handle_params(age)
  end

  defp handle_params("banana", 42) do
    {:ok, "You are very special"}
  end

  defp handle_params(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp handle_params(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
