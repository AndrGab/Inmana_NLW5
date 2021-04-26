defmodule Inmana.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_restaurant_not_found_error, do: build(:not_found, "Restaurant not found")
  def build_supply_not_found_error, do: build(:not_found, "Supply not found")
end
