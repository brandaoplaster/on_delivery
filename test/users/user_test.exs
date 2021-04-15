defmodule OnDelivery.Users.UserTest do
  use ExUnit.Case

  alias OnDelivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Lucas",
          "lucas@gmail.com",
          "123456789",
          18,
          "Rua into XX"
        )

      expected_response =
        {:ok,
         %User{
           address: "Rua into XX",
           age: 18,
           cpf: "123456789",
           email: "lucas@gmail.com",
           name: "Lucas"
         }}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Lucas",
          "lucas@gmail.com",
          "123456789",
          10,
          "Rua into XX"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
