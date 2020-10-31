defmodule Saints.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Cachex, name: :saints_cache},
      {Plug.Cowboy, scheme: :http, plug: Saints.Router, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: Saints.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
