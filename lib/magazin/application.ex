defmodule Magazin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Magazin.Repo,
      # Start the Telemetry supervisor
      MagazinWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Magazin.PubSub},
      # Start the Endpoint (http/https)
      MagazinWeb.Endpoint
      # Start a worker by calling: Magazin.Worker.start_link(arg)
      # {Magazin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Magazin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MagazinWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
