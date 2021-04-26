defmodule Inmana.Supplies.Create do
  alias Inmana.{Supply, Repo, Error}

  def call(params) do
    params
    |> Supply.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Supply{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
