defmodule OnixEx.MixProject do
  use Mix.Project

  @source_url "https://github.com/anderkonzen/onix_ex"
  @version "0.1.0"

  def project() do
    [
      app: :onix_ex,
      version: @version,
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Elixir parser for the ONIX for Books standard",
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.lcov": :test,
        "coveralls.html": :test
      ],
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/project.plt"}
      ]
    ]
  end

  # Configuration for the OTP application
  def application() do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps() do
    [
      {:ex_doc, "~> 0.30.3", only: :dev, runtime: false},
      {:excoveralls, "~> 0.16.1", only: :test, runtime: false},
      {:credo, "~> 1.7.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3.0", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.12.2", only: [:dev, :test], runtime: false}
    ]
  end

  defp package() do
    [
      maintainers: ["Anderson Konzen"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
