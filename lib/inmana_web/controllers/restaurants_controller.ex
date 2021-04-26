defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.get_restaurant_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("restaurant.json", restaurant: restaurant)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %Restaurant{}} <- Inmana.delete_restaurant(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def update(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.update_restaurant(params) do
      conn
      |> put_status(:ok)
      |> render("restaurant.json", restaurant: restaurant)
    end
  end
end
