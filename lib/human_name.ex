defmodule HumanName do
  @moduledoc """
  Documentation for HumanName.
  """

  @doc """
  Returns the initial for the first (given) name.

  ## Example

        iex> HumanName.first_initial("Jimmy H Jenkins")
        {:ok, "J"}

        iex> HumanName.first_initial("Dr. Alibaster Cornelius Juniper III")
        {:ok, "A"}

        iex> HumanName.first_initial("")
        {:error, "No valid name found"}

        iex> HumanName.first_initial(nil)
        {:error, "No valid name found"}
  """
  def first_initial(full_name) when is_binary(full_name) and full_name != "",
    do: HumanName.Native.first_initial(full_name)

  def first_initial(_), do: name_not_provided()

  @doc """
  Returns the initial for the first (given) name and the full last name (surname).

  ## Example

        iex> HumanName.first_initial_last("Jimmy H Jenkins")
        {:ok, "J. Jenkins"}

        iex> HumanName.first_initial_last("Dr. Alibaster Cornelius Juniper III")
        {:ok, "A. Juniper"}

        iex> HumanName.first_initial_last("")
        {:error, "No valid name found"}
  """
  def first_initial_last(full_name) when is_binary(full_name) and full_name != "",
    do: HumanName.Native.first_initial_last(full_name)

  def first_initial_last(_), do: name_not_provided()

  @doc """
  Returns just the formatted first (given) name.

  ## Example

        iex> HumanName.first_name("Jimmy H Jenkins")
        {:ok, "Jimmy"}

        iex> HumanName.first_name("Dr. Alibaster Cornelius Juniper III")
        {:ok, "Alibaster"}

        iex> HumanName.first_name("")
        {:error, "No valid name found"}
  """
  def first_name(full_name) when is_binary(full_name) and full_name != "",
    do: HumanName.Native.first_name(full_name)

  def first_name(_), do: name_not_provided()

  @doc """
  Returns the combined initials for the first (given) name and last (surname) name.

  ## Example

        iex> HumanName.initials("Jimmy H Jenkins")
        {:ok, "JJ"}

        iex> HumanName.initials("Dr. Alibaster Cornelius Juniper III")
        {:ok, "AJ"}

        iex> HumanName.initials("")
        {:error, "No valid name found"}
  """
  def initials(full_name) when is_binary(full_name) and full_name != "",
    do: HumanName.Native.initials(full_name)

  def initials(_), do: name_not_provided()

  @doc """
  Returns just the formatted last name (surname).

  ## Example

        iex> HumanName.last_name("Jimmy H Jenkins")
        {:ok, "Jenkins"}

        iex> HumanName.last_name("Dr. Alibaster Cornelius Juniper III")
        {:ok, "Juniper"}

        iex> HumanName.last_name("")
        {:error, "No valid name found"}
  """
  def last_name(full_name) when is_binary(full_name) and full_name != "",
    do: HumanName.Native.last_name(full_name)

  def last_name(_), do: name_not_provided()

  @doc """
  Returns a formatted version of just the first (given) and last (surname) names.

  ## Example

        iex> HumanName.normalize("Jimmy H Jenkins")
        {:ok, "Jimmy Jenkins"}

        iex> HumanName.normalize("Dr. Alibaster Cornelius Juniper III")
        {:ok, "Alibaster Juniper"}

        iex> HumanName.normalize("fred mccalister  ")
        {:ok, "Fred McCalister"}

        iex> HumanName.normalize("")
        {:error, "No valid name found"}
  """
  def normalize(full_name) when is_binary(full_name) and full_name != "",
    do: HumanName.Native.normalize(full_name)

  def normalize(_), do: name_not_provided()

  @doc """
  Returns a formatted version of the entire name.

  ## Example

        iex> HumanName.normalize_full("JIMMY H JENKINS")
        {:ok, "Jimmy H. Jenkins"}

        iex> HumanName.normalize_full("Dr. Alibaster Cornelius Juniper III")
        {:ok, "Alibaster Cornelius Juniper, III"}

        iex> HumanName.normalize_full("")
        {:error, "No valid name found"}
  """
  def normalize_full(full_name) when is_binary(full_name) and full_name != "",
    do: HumanName.Native.normalize_full(full_name)

  def normalize_full(_), do: name_not_provided()

  defp name_not_provided(), do: {:error, "No valid name found"}
end
