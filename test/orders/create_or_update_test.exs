defmodule OnDelivery.Orders.CreateOrUpdateTeste do
  use ExUnit.Case

  import OnDelivery.Factory

  alias OnDelivery.Users.Agent, as: UserAgent
  alias OnDelivery.Orders.CreateOrUpdate

  describe "call/1" do
    setup do
      cpf = "12345678922"
      user = build(:user, cpf: cpf)

      OnDelivery.start_agentes()
      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pizza 4 queijos",
        quantity: 1,
        unity_price: "30.00"
      }

      item2 = %{
        category: :pizza,
        description: "Pizza de frango",
        quantity: 1,
        unity_price: "40.00"
      }

      {:ok, cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, save the order", %{cpf: cpf, item1: item1, item2: item2} do
      params = %{
        user_cpf: cpf,
        items: [item1, item2]
      }

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns an error", %{item1: item1, item2: item2} do
      params = %{
        user_cpf: "098765432122",
        items: [item1, item2]
      }

      assert {:error, "User not found"} = CreateOrUpdate.call(params)
    end

    test "when there are invalid items, returns an error", %{cpf: cpf, item1: item1, item2: item2} do
      params = %{
        user_cpf: cpf,
        items: [%{item1 | quantity: 0}, item2]
      }

      assert {:error, "Invalid items"} = CreateOrUpdate.call(params)
    end

    test "when there are no items, returns an error", %{cpf: cpf} do
      params = %{
        user_cpf: cpf,
        items: []
      }

      assert {:error, "Invalid parameters"} = CreateOrUpdate.call(params)
    end
  end
end
