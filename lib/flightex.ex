defmodule Flightex do
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Flightex.Users.Get, as: GetUser

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking
  alias Flightex.Bookings.Get, as: GetBooking

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate get_user(id), to: GetUser, as: :call

  defdelegate create_booking(user_id, params), to: CreateOrUpdateBooking, as: :call
  defdelegate get_booking(id), to: GetBooking, as: :call
end
