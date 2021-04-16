defmodule OnDelivery.Users.UserTest do
  use ExUnit.Case

  alias OnDelivery.Users.User

  import OnDelivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "brandaoplaster",
          "bp@gmail.com",
          "12345678933",
          20,
          "Rua into xx"
        )

      expected_response = {:ok, build(:user)}

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
