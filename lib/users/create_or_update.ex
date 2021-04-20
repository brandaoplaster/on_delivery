defmodule OnDelivery.Users.CreateOrUpdate do
  alias OnDelivery.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%{name: name, email: email, cpf: cpf, age: age, address: address}) do
    name
    |> User.build(email, cpf, age, address)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)
    {:ok, "User created or updated successfully"}
  end

  defp save_user({:error, _reason} = error), do: error
end
