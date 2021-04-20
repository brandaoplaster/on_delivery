defmodule OnDelivery.Users.CreateOrUpdateTeste do
  use ExUnit.Case

  alias OnDelivery.Users.Agent, as: UserAgent
  alias OnDelivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid, save the user" do
      params = %{
        name: "lucas",
        email: "lucas@gmail.com",
        cpf: "12345678955",
        age: 20,
        address: "rua greep"
      }

      response = CreateOrUpdate.call(params)
      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "lucas",
        email: "lucas@gmail.com",
        cpf: "12345678955",
        age: 17,
        address: "rua greep"
      }

      response = CreateOrUpdate.call(params)
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
