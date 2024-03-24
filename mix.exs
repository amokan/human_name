defmodule HumanName.MixProject do
  use Mix.Project

  @version "0.5.0"
  @description "Elixir bindings for the human-name crate implemented as a safe Rust NIF."
  @repo_url "https://github.com/amokan/human_name"

  def project do
    [
      app: :human_name,
      version: @version,
      elixir: "~> 1.12",
      description: @description,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),

      # Coverage
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.31.2", only: [:dev, :docs], runtime: false},
      {:excoveralls, "~> 0.18.0", only: :test},
      {:rustler, ">= 0.0.0", optional: true},
      {:rustler_precompiled, "~> 0.7.1"}
    ]
  end

  defp docs do
    [
      main: "HumanName",
      extras: [
        "README.md",
        "CHANGELOG.md",
        "LICENSE.txt"
      ],
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"],
      source_ref: "v#{@version}",
      source_url: @repo_url
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{"GitHub" => @repo_url},
      maintainers: ["Adam Mokan"],
      files: [
        "lib",
        "native",
        "checksum-*.exs",
        "mix.exs",
        "README.md",
        "CHANGELOG.md",
        "LICENSE.txt"
      ],
      exclude_patterns: [
        "native/human_name_nif/target"
      ]
    }
  end
end
