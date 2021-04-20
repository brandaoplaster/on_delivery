defmodule OnDelivery.Users.AgentTest do
  use ExUnit.Case

  alias OnDelivery.Users.Agent, as: UserAgent
  alias OnDelivery.Users.User

  import OnDelivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when the user is found, returns the user" do
      :user
      |> build(cpf: "12345678911")
      |> UserAgent.save()

      response = UserAgent.get("12345678911")

      expected_response =
        {:ok,
         %User{
           address: "Rua into xx",
           age: 20,
           cpf: "12345678911",
           email: "bp@gmail.com",
           name: "brandaoplaster"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("12345678911")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
