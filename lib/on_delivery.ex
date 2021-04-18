defmodule OnDelivery do
  alias OnDelivery.Users.Agent, as: UserAgent
  alias OnDelivery.Orders.Agent, as: OrderAgent
  alias OnDelivery.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias OnDelivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrder

  def start_agentes do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
end
