defmodule OnDelivery.Factory do
  use ExMachina

  alias OnDelivery.Users.User
  alias OnDelivery.Orders.Item

  def user_factory do
    %User{
      name: "brandaoplaster",
      email: "bp@gmail.com",
      cpf: "12345678933",
      age: 20,
      address: "Rua into xx"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza 4 queijos",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("30.00")
    }
  end
end
