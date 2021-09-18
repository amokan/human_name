defmodule NifNotLoadedError do
  @moduledoc false
  defexception message: "nif not loaded"
end

defmodule HumanName.Native do
  @moduledoc false
  use Rustler, otp_app: :human_name, crate: "human_name_nif"

  @doc false
  def first_initial(_full_name), do: err()

  @doc false
  def first_initial_last(_full_name), do: err()

  @doc false
  def first_name(_full_name), do: err()

  @doc false
  def initials(_full_name), do: err()

  @doc false
  def last_name(_full_name), do: err()

  @doc false
  def normalize(_full_name), do: err()

  @doc false
  def normalize_full(_full_name), do: err()

  defp err() do
    throw(NifNotLoadedError)
  end
end
