defmodule Saints.MixProject do
  use Mix.Project

  def project do
    [
      app: :saints,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :cachex],
      mod: {Saints.Application, []}
    ]
  end

  defp deps do
    [
      {:ex_ical, "~> 0.2.0"},
      {:cachex, "~> 3.3"},
      {:plug_cowboy, "~> 2.0"},
      {:jason, "~> 1.2"},
      {:credo, "~> 1.5.0-rc.2", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end
end
