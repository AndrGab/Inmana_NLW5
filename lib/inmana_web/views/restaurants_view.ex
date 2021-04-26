defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :view

  alias Inmana.Restaurant

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end

  def render("restaurant.json", %{restaurant: %Restaurant{} = restaurant}),
    do: %{restaurant: restaurant}
end
