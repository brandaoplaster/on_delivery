defmodule OnDelivery.Factory do
  use ExMachina

  alias OnDelivery.Users.User
  alias OnDelivery.Orders.{Item, Order}

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

  def order_factory do
    %Order{
      delivery_address: "Rua into xx",
      items: [
        build(:item),
        %Item{
          category: :japonesa,
          description: "sorver de mel",
          quantity: 1,
          unity_price: Decimal.new("10.00")
        }
      ],
      total_price: Decimal.new("40.00"),
      user_cpf: "12345678933"
    }
  end
end
