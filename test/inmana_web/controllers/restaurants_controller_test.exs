defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "returns a user when params are valid", %{conn: conn} do
      params = %{"name" => "Yummi", "email" => "yummi@email.com"}

      route = Routes.restaurants_path(conn, :create, params)

      response =
        conn
        |> post(route)
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "yummi@email.com",
                 "id" => _uuid,
                 "name" => "Yummi"
               }
             } = response
    end

    test "returns an error when params invalid", %{conn: conn} do
      params = %{"name" => "Y", "email" => "yummiemail.com"}

      route = Routes.restaurants_path(conn, :create, params)

      response =
        conn
        |> post(route)
        |> json_response(:bad_request)

      expected = %{
        "message" => %{
          "email" => ["has invalid format"],
          "name" => ["should be at least 2 character(s)"]
        }
      }

      assert expected == response
    end
  end
end
