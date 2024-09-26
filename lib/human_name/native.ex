defmodule HumanName.Native do
  @moduledoc false
  require Logger

  mix_config = Mix.Project.config()
  version = mix_config[:version]
  github_url = mix_config[:package][:links]["GitHub"]

  env_config = Application.compile_env(:human_name, HumanName, [])

  use RustlerPrecompiled,
    otp_app: :human_name,
    crate: "human_name_nif",
    mode: :release,
    base_url: "#{github_url}/releases/download/v#{version}",
    force_build:
      System.get_env("HUMAN_NAME_BUILD") in ["1", "true"] or env_config[:build_from_source],
    version: version

  @doc false
  def first_initial(_full_name), do: err()

  @doc false
  def consistent_with(_full_name_one, _full_name_two), do: err()

  @doc false
  def first_initial_last(_full_name), do: err()

  @doc false
  def first_name(_full_name), do: err()

  def middle_names(_full_name), do: err()

  def middle_initials(_full_name), do: err()

  @doc false
  def first_and_last_initials(_full_name), do: err()

  @doc false
  def last_name(_full_name), do: err()

  @doc false
  def normalize(_full_name), do: err()

  @doc false
  def normalize_full(_full_name), do: err()

  defp err() do
    :erlang.nif_error(:nif_not_loaded)
  end
end
