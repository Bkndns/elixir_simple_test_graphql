defmodule Comm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Comm.Repo,
      # Start the Telemetry supervisor
      CommWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Comm.PubSub},
      # Start the Endpoint (http/https)
      CommWeb.Endpoint
      # Start a worker by calling: Comm.Worker.start_link(arg)
      # {Comm.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Comm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CommWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
