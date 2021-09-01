defmodule Flightex.Bookings.Get do
  alias Flightex.Bookings.Agent, as: BookingAgent

  def call(id) when is_bitstring(id) do
    BookingAgent.get(id)
  end

  def call(_id) do
    {:error, "Invalid parameters"}
  end
end
