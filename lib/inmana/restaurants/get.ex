defmodule Inmana.Restaurants.Get do
  alias Inmana.{Error, Repo, Restaurant}

  def by_id(id) do
    case Repo.get(Restaurant, id) do
      nil -> {:error, Error.build_restaurant_not_found_error()}
      restaurant -> {:ok, restaurant}
    end
  end
end
