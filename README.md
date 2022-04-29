# HumanName

[![CI](https://github.com/amokan/human_name/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/amokan/human_name/actions/workflows/ci.yaml)
[![Hex.pm](https://img.shields.io/hexpm/v/human_name.svg)](https://hex.pm/packages/human_name)
[![Coverage Status](https://coveralls.io/repos/github/amokan/human_name/badge.svg?branch=main)](https://coveralls.io/github/amokan/human_name?branch=main)

Elixir bindings for the [human-name](https://crates.io/crates/human_name) crate implemented as a safe Rust NIF.

## Installation

This package can be installed by adding `human_name` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:human_name, "~> 0.2.2"}
  ]
end
```

By default **you do not need Rust installed** because the lib will try to download a precompiled NIF file.

In case you want to force compilation set the
`HUMAN_NAME_BUILD` environment variable to `true` or `1`.

To run tests locally, you could do a `HUMAN_NAME_BUILD=1 mix test`.

Alternatively you can also set the application env `:build_from_source` to `true` in order to force the build:

```elixir
config :human_name, HumanName, build_from_source: true
```

## Usage

```elixir
iex> HumanName.first_name("Dr. Alibaster Cornelius Juniper III")
{:ok, "Alibaster"}

iex> HumanName.initials("Dr. Alibaster Cornelius Juniper III")
{:ok, "AJ"}

iex> HumanName.last_name("Dr. Alibaster Cornelius Juniper III")
{:ok, "Juniper"}

iex> HumanName.normalize("Dr. Alibaster Cornelius Juniper III")
{:ok, "Alibaster Juniper"}

iex> HumanName.normalize_full("JIMMY H JENKINS")
{:ok, "Jimmy H. Jenkins"}
```

----

## License

MIT License

See the [license file](LICENSE.txt) for details.
