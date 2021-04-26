defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "returns a valid changeset when params are valid" do
      params = %{"name" => "Yummmy", "email" => "yummy@email.com"}
      return = Restaurant.changeset(params)

      assert %Changeset{valid?: true} = return
    end

    test "returns an error when name is too short" do
      params = %{"name" => "Y", "email" => "yummy@email.com"}
      return = Restaurant.changeset(params)

      expected_errors = %{name: ["should be at least 2 character(s)"]}

      assert %Changeset{valid?: false} = return
      assert expected_errors == errors_on(return)
    end

    test "returns an error when email isn't valid" do
      params = %{"name" => "Yummy", "email" => "yummyemail.com"}
      return = Restaurant.changeset(params)

      expected_errors = %{email: ["has invalid format"]}

      assert %Changeset{valid?: false} = return
      assert expected_errors == errors_on(return)
    end

    test "returns an error when params are missing" do
      params = %{"name" => "Yummy"}
      return = Restaurant.changeset(params)

      expected_errors = %{email: ["can't be blank"]}

      assert %Changeset{valid?: false} = return
      assert expected_errors == errors_on(return)
    end
  end
end
