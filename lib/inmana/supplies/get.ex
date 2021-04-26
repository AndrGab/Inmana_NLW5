defmodule Inmana.Supplies.Get do
  alias Inmana.{Error, Repo, Supply}

  def call(uuid) do
    case Repo.get(Supply, uuid) do
      nil -> {:error, Error.build_supply_not_found_error()}
      supply -> {:ok, supply}
    end
  end
end
