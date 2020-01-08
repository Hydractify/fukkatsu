defmodule Fukkatsu.Repo do
  use Ecto.Repo,
    otp_app: :fukkatsu,
    adapter: Ecto.Adapters.Postgres
end
