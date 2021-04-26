defmodule Inmana.Restaurants.Delete do
  alias Inmana.{Error, Repo, Restaurant}

  def call(id) do
    case Repo.get(Restaurant, id) do
      nil -> {:error, Error.build_restaurant_not_found_error()}
      restaurant -> Repo.delete(restaurant)
    end
  end
end
