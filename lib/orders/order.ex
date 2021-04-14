defmodule OnDelivey.Orders.Order do
  @key [:user_cpf, :delivery_address, :items, :total_price]

  @enforce_keys @key

  defstruct @key

  def build do
    {:ok, %__MODULE__{user_cpf: nil, delivery_address: nil, items: nil, total_price: nil}}
  end
end
