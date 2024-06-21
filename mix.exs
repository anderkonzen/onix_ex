defmodule OnixEx.MixProject do
  use Mix.Project

  @source_url "https://github.com/anderkonzen/onix_ex"
  @version "0.1.0"

  def project() do
    [
      app: :onix_ex,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      description: "Elixir parser for the ONIX for Books standard",
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        linter: :test,
        deps_audit: :test,
        ci: :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.lcov": :test,
        "coveralls.html": :test
      ],
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        # Dialyze in MIX_ENV=test (CI)
        plt_add_apps: [:ex_unit]
      ]
    ]
  end

  # Configuration for the OTP application
  def application() do
    [
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps() do
    [
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false},
      {:excoveralls, "~> 0.18", only: :test, runtime: false},
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.13", only: [:dev, :test], runtime: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      linter: ["credo --strict", "format --check-formatted", "sobelow --config"],
      deps_audit: ["deps.audit", "deps.unlock --check-unused"],
      ci: [
        "compile --warnings-as-errors --all-warnings",
        "linter",
        "deps_audit",
        "dialyzer",
        "test"
      ]
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
