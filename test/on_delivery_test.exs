defmodule OnDeliveryTest do
  use ExUnit.Case
  doctest OnDelivery

  @tag :skip
  test "greets the world" do
    assert OnDelivery.hello() == :world
  end
end
