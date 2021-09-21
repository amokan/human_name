# HumanName

[![CI](https://github.com/amokan/human_name/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/amokan/human_name/actions/workflows/ci.yaml)
[![Hex.pm](https://img.shields.io/hexpm/v/human_name.svg)](https://hex.pm/packages/human_name)
[![Coverage Status](https://coveralls.io/repos/github/amokan/human_name/badge.svg?branch=main)](https://coveralls.io/github/amokan/human_name?branch=main)

Elixir bindings for the [human-name](https://crates.io/crates/human_name) crate implemented as a safe Rust NIF.

## Installation

_Be sure to [install Rust](https://www.rust-lang.org/tools/install)._

This package can be installed by adding `human_name` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:human_name, "~> 0.1.2"}
  ]
end
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
