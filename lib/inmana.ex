defmodule Inmana do
  alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.Restaurants.Get, as: RestaurantGet
  alias Inmana.Restaurants.Update, as: RestaurantUpdate
  alias Inmana.Restaurants.Delete, as: RestaurantDelete

  alias Inmana.Supplies.Create, as: SupplyCreate
  alias Inmana.Supplies.Get, as: SupplyGet

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate get_restaurant_by_id(params), to: RestaurantGet, as: :by_id
  defdelegate update_restaurant(params), to: RestaurantUpdate, as: :call
  defdelegate delete_restaurant(params), to: RestaurantDelete, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate get_supply(params), to: SupplyGet, as: :call
end
