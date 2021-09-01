defmodule Flightex.Users.Get do
  alias Flightex.Users.Agent, as: UserAgent

  def call(id) when is_bitstring(id) do
    UserAgent.get(id)
  end

  def call(_id) do
    {:error, "Invalid parameters"}
  end
end
