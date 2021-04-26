defmodule Inmana.Restaurants.Update do
  alias Inmana.{Error, Repo, Restaurant}

  def call(%{"id" => id} = params) do
    case Repo.get(Restaurant, id) do
      nil -> {:error, Error.build_restaurant_not_found_error()}
      restaurant -> do_update(restaurant, params)
    end
  end

  defp do_update(restaurant, params) do
    restaurant
    |> Restaurant.changeset(params)
    |> Repo.update()
  end
end
