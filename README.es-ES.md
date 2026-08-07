

# HumanName

[![CI](https://github.com/amokan/human_name/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/amokan/human_name/actions/workflows/ci.yaml)
[![Hex.pm](https://img.shields.io/hexpm/v/human_name.svg)](https://hex.pm/packages/human_name)
[![Coverage Status](https://coveralls.io/repos/github/amokan/human_name/badge.svg?branch=main)](https://coveralls.io/github/amokan/human_name?branch=main)

Wrapper en Elixir para el excelente crate [human-name](https://crates.io/crates/human_name) de [David Judd](https://github.com/djudd), implementado como un NIF en Rust compatible con BEAM.

La API implementada para su uso en Elixir/Erlang no cubre todos los aspectos de la biblioteca de Rust. Siéntete libre de abrir un PR para contribuir.

## Instalación

Este paquete se puede instalar agregando `human_name` a tu lista de dependencias en `mix.exs`:

```elixir
def deps do
  [
    {:human_name, "~> 0.6.2"}
  ]
end
```

Por defecto, **no necesitas tener Rust instalado** porque la biblioteca intentará descargar un archivo NIF precompilado.

En caso de que quieras forzar la compilación, establece la variable de entorno `HUMAN_NAME_BUILD` en `true` o `1`.

Para ejecutar las pruebas localmente, puedes ejecutar `HUMAN_NAME_BUILD=1 mix test`.

Alternativamente, también puedes establecer la variable de configuración de la aplicación `:build_from_source` en `true` para forzar la compilación:

```elixir
config :human_name, HumanName, build_from_source: true
```

## Uso

```elixir
iex> HumanName.consistent_with?("Jimmy H Jenkins", "Jim Jenkins")
{:ok, true}

iex> HumanName.first_and_last_initials("Dr. Alibaster Cornelius Juniper III")
{:ok, "AJ"}

iex> HumanName.first_initial("Dr. Alibaster Cornelius Juniper III")
{:ok, "A"}

iex> HumanName.first_initial_last("Jimmy H Jenkins")
{:ok, "J. Jenkins"}

iex> HumanName.first_name("Dr. Alibaster Cornelius Juniper III")
{:ok, "Alibaster"}

iex> HumanName.middle_initials("Dr. Alibaster Cornelius Juniper III")
{:ok, "C"}

iex> HumanName.middle_name("Dr. Alibaster Cornelius Juniper III")
{:ok, "Cornelius"}

iex> HumanName.last_initial("Jimmy H Jenkins")
{:ok, "J"}

iex> HumanName.last_name("Dr. Alibaster Cornelius Juniper III")
{:ok, "Juniper"}

iex> HumanName.normalize("Dr. Alibaster Cornelius Juniper III")
{:ok, "Alibaster Juniper"}

iex> HumanName.normalize_full("JIMMY H JENKINS")
{:ok, "Jimmy H. Jenkins"}
```

----

## Licencia

Licencia MIT

Consulta el [archivo de licencia](LICENSE.txt) para obtener más detalles.
