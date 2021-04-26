defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{"name" => "Restaurant", "email" => "email@email.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      return = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "email@email.com",
                 id: _uuid,
                 name: "Restaurant"
               }
             } = return
    end
  end
end
