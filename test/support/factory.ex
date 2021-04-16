defmodule OnDelivery.Factory do
  use ExMachina

  alias OnDelivery.Users.User

  def user_factory do
    %User{
      name: "brandaoplaster",
      email: "bp@gmail.com",
      cpf: "12345678933",
      age: 20,
      address: "Rua into xx"
    }
  end
end
