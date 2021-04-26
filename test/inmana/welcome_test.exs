defmodule Inmana.WelcomeTest do
  use ExUnit.Case, asyn: true

  alias Inmana.Welcomer

  describe "call/1" do
    test "should return a welcome when user is of legal age" do
      params = %{"name" => "Example", "age" => "21"}
      return = Welcomer.welcome(params)
      expected = {:ok, "Welcome example"}

      assert expected == return
    end

    test "should return an special message for a special user" do
      params = %{"name" => "BaNaNA", "age" => "42"}
      return = Welcomer.welcome(params)
      expected = {:ok, "You are very special"}

      assert expected == return
    end

    test "should return an error when user is a minor" do
      params = %{"name" => "Example", "age" => "20"}
      return = Welcomer.welcome(params)
      expected = {:ok, "Welcome example"}

      assert expected == return
    end
  end
end
