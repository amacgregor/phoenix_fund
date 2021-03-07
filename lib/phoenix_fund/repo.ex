defmodule PhoenixFund.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_fund,
    adapter: Ecto.Adapters.Postgres
end
