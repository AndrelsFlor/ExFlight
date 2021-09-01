defmodule Flightex.Bookings.CreateOrUpdate do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking
  alias Flightex.Users.Get, as: GetUser
  alias Flightex.Users.User

  def call(user_id, params) do
    user_id
    |> get_user()
    |> build_booking(user_id, params)
    |> save_booking()
  end

  defp build_booking({:ok, %User{}}, user_id, params), do: Booking.build(user_id, params)

  defp build_booking({:error, _reason} = error, _user_id, _params), do: error

  defp get_user(user_id) do
    GetUser.call(user_id)
  end

  defp save_booking({:ok, %Booking{id: id} = booking}) do
    BookingAgent.save(booking)
    {:ok, id}
  end

  defp save_booking({:error, _reason} = error), do: error
end
