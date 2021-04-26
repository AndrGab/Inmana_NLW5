defmodule Inmana.Supplies.GetByExpiration do
  import Ecto.Query

  alias Inmana.{Error, Repo, Restaurant, Supply}

  def call do
    today = Date.utc_today()
    beginning_of_week = Date.beginning_of_week(today)
    end_of_week = Date.end_of_week(today)

    query =
      from(supply in Supply,
        where:
          supply.expiration_date >= ^beginning_of_week and supply.expiration_date <= ^end_of_week,
        preload: [:restaurant]
      )

    result =
      query
      |> Repo.all()
      |> Enum.group_by(fn %Supply{restaurant: %Restaurant{email: email}} -> email end)

    handle_result(result)
  end

  defp handle_result(result) do
    case result do
      nil -> {:error, Error.build(:not_found, "Empty database")}
      supplies -> {:ok, supplies}
    end
  end
end
