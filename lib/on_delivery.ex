defmodule OnDelivery do
  alias OnDelivery.Users.CreateOrUpdate
  alias OnDelivery.Users.Agent, as: UserAgent

  def start_agentes do
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call
end
