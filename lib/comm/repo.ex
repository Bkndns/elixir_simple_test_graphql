defmodule Comm.Repo do
  use Ecto.Repo,
    otp_app: :comm,
    adapter: Ecto.Adapters.Postgres
end
