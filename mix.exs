defmodule EctoCSV.Mixfile do
  use Mix.Project

  @name "EctoCSV"
  @version "0.0.1"
  @url "https://github.com/aditya7iyengar/ecto_csv"

  def project do
    [
      app: :ecto_csv,
      build_embedded: Mix.env == :prod,
      deps: deps(),
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      version: @version,
      description: description(),
      package: package(),

      # Docs
      name: @name,
      docs: docs(),

      # Test
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test],
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env),
    ]
  end

  def application do
    [
      extra_applications: [
        :csv,
        :ecto,
        :logger,
      ]
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.5", only: [:dev, :test]},
      {:csv, "~> 2.0.0"},
      {:ecto, "~> 2.1"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false},
      {:excoveralls, "~> 0.3", only: :test},
      {:inch_ex, "~> 0.5", only: [:dev, :test, :docs]},
    ]
  end

  def package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Adi Iyengar"],
      licenses: ["MIT"],
      links: %{"Github" => @url},
    ]
  end

  defp description do
    """
    Ecto adapter for CSVs as data source.
    """
  end

  def docs do
    [
      main: @name,
      source_url: @url,
      extras: ["doc_readme.md", "CHANGELOG.md"],
      source_ref: "v#{@version}"
    ]
  end

  defp aliases do
    [
      "ecto.setup": [
        "ecto.create",
        "ecto.migrate"
      ],
     "ecto.reset": [
        "ecto.drop",
        "ecto.setup"
      ],
     "test": [
        # "ecto.drop",
        "ecto.create --quiet",
        "ecto.migrate",
        "test"
      ],
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "priv", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]
end
