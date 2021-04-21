defmodule OnDelivery.Orders.Report do
  alias OnDelivery.Orders.Agent, as: OrderAgent
  alias OnDelivery.Orders.{Item, Order}

  def create(filename \\ "report.csv") do
    order_list = build_order_list()

    File.write(filename, order_list)
  end

  defp build_order_list() do
    OrderAgent.get_all()
    |> Map.values()
    |> Enum.map(&order_string(&1))
  end

  defp order_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    items_string =
      items
      |> Enum.map(&item_string(&1))

    "#{cpf},#{items_string},#{total_price}"
  end

  defp item_string(%Item{category: category, quantity: quantity, unity_price: unity_price}) do
    "#{category},#{quantity},#{unity_price}"
  end
end
