defmodule Flightex.Users.CreateOrUpdate do
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.User

  def call(params) do
    params
    |> User.build()
    |> save_user()
  end

  defp save_user({:ok, %User{id: id} = user}) do
    UserAgent.save(user)
    {:ok, id}
  end

  defp save_user({:error, _reason} = error), do: error
end
