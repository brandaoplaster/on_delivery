defmodule OnDelivery.Orders.OrderTest do
  use ExUnit.Case

  alias OnDelivery.Orders.Order

  import OnDelivery.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "sorver de mel",
          category: :japonesa,
          quantity: 1,
          unity_price: Decimal.new("10.00")
        )
      ]

      response = Order.build(user, items)
      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "when there is not items in the order, returns an error" do
      user = build(:user)
      items = []

      response = Order.build(user, items)
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
