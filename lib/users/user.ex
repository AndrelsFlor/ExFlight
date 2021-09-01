defmodule Flightex.Users.User do
  @keys [:name, :email, :cpf, :id]
  @enforce_keys @keys
  defstruct @keys

  def build(%{name: name, email: email, cpf: cpf}) do
    {
      :ok,
      %__MODULE__{
        id: UUID.uuid4(),
        name: name,
        email: email,
        cpf: cpf
      }
    }
  end

  def build(_), do: {:error, "Invalid parameters"}
end
