defmodule OnDelivery.Orders.ReportTest do
  use ExUnit.Case

  import OnDelivery.Factory

  alias OnDelivery.Orders.Agent, as: OrderAgent
  alias OnDelivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected_response =
        "12345678933,pizza,1,30.00japonesa,1,10.00,40.00\n" <>
          "12345678933,pizza,1,30.00japonesa,1,10.00,40.00\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
