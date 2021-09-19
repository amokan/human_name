defmodule HumanName.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "Elixir bindings for the human-name crate implemented as a safe Rust NIF."
  @repo_url "https://github.com/amokan/human_name"

  def project do
    [
      app: :human_name,
      version: @version,
      elixir: "~> 1.12",
      description: @description,
      start_permanent: Mix.env() == :prod,
      rustler_crates: rustler_crates(),
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
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, ">= 0.23.0", only: [:dev, :docs], runtime: false},
      {:rustler, "~> 0.22.0"}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @repo_url,
      extras: [
        "README.md",
        "CHANGELOG.md",
        "LICENSE.txt"
      ]
    ]
  end

  defp rustler_crates() do
    [
      human_name_nif: [
        path: "native/human_name_nif",
        mode: :release
      ]
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{"GitHub" => @repo_url},
      maintainers: ["Adam Mokan"]
    }
  end
end
