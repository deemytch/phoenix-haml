defmodule Magazin.Repo do
  use Ecto.Repo,
    otp_app: :magazin,
    adapter: Ecto.Adapters.Postgres
end
