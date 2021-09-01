defmodule Flightex.Bookings.Booking do
  @keys [:complete_date, :local_origin, :local_destination, :user_id, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(user_id, %{
        local_origin: local_origin,
        local_destination: local_destination
      }) do
    {
      :ok,
      %__MODULE__{
        id: UUID.uuid4(),
        user_id: user_id,
        local_origin: local_origin,
        local_destination: local_destination,
        complete_date: NaiveDateTime.utc_now()
      }
    }
  end
end
