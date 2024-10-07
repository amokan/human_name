defmodule HumanName do
  @moduledoc """
  Documentation for HumanName.
  """

  defguardp is_non_empty_binary(value) when is_binary(value) and value != ""

  @doc """
  Performs a comparison of two full names to determine if they are potentially consistent with each other.

  It is important to take into account the nuance of this consistency by reading
  the [_Defining “consistency”_](https://docs.rs/human_name/latest/human_name/struct.Name.html#defining-consistency) section of the rust library documentation.

  ## Example

        iex> HumanName.consistent_with?("Jimmy H Jenkins", "Jim Jenkins")
        {:ok, true}

        iex> HumanName.consistent_with?("John Doe", "Johnny J. Doe")
        {:ok, true}

        iex> HumanName.consistent_with?("Dr. Alibaster Cornelius Juniper III", "Alibaster Juniper")
        {:ok, true}

        iex> HumanName.consistent_with?("Dr. Alibaster Cornelius Juniper III", "Jimmy H Jenkins")
        {:ok, false}

        iex> HumanName.consistent_with?(12345, "John Doe")
        {:error, "No valid names found"}

        iex> HumanName.consistent_with?("fj20i424j", "thisisnotavalidname")
        {:error, "No valid name_one found"}

        iex> HumanName.consistent_with?("Jimmy H Jenkins", "1234")
        {:error, "No valid name_two found"}

        iex> HumanName.consistent_with?(nil, nil)
        {:error, "No valid names found"}
  """
  def consistent_with?(full_name_one, full_name_two)
      when is_non_empty_binary(full_name_one) and is_non_empty_binary(full_name_two),
      do: HumanName.Native.consistent_with(full_name_one, full_name_two)

  def consistent_with?(_, _), do: names_not_provided()

  @doc """
  Returns the initial for the first (given) name.

  ## Example

        iex> HumanName.first_initial("Jimmy H Jenkins")
        {:ok, "J"}

        iex> HumanName.first_initial("Dr. Alibaster Cornelius Juniper III")
        {:ok, "A"}

        iex> HumanName.first_initial(12345)
        {:error, "No valid name found"}

        iex> HumanName.first_initial("")
        {:error, "No valid name found"}

        iex> HumanName.first_initial(nil)
        {:error, "No valid name found"}
  """
  def first_initial(full_name) when is_non_empty_binary(full_name),
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
  def first_initial_last(full_name) when is_non_empty_binary(full_name),
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
  def first_name(full_name) when is_non_empty_binary(full_name),
    do: HumanName.Native.first_name(full_name)

  def first_name(_), do: name_not_provided()

  @doc """
  Returns the inferred middle name for a provided full name.

  ## Example

        iex> HumanName.middle_name("Dr. Alibaster Cornelius Juniper III")
        {:ok, "Cornelius"}

        iex> HumanName.middle_name("Jimmy H Jenkins")
        {:error, "No middle name found"}

        iex> HumanName.middle_name("")
        {:error, "No valid name found"}
  """
  def middle_name(full_name) when is_non_empty_binary(full_name),
    do: HumanName.Native.middle_name(full_name)

  def middle_name(_), do: name_not_provided()

  @doc """
  Returns the middle initials for a provided full name.

  ## Example

        iex> HumanName.middle_initials("Dr. Alibaster Cornelius Juniper III")
        {:ok, "C"}

        iex> HumanName.middle_initials("Jimmy H Jenkins")
        {:ok, "H"}

        iex> HumanName.middle_initials("Jimmy Jenkins")
        {:error, "No middle initials found"}

        iex> HumanName.middle_initials("")
        {:error, "No valid name found"}
  """
  def middle_initials(full_name) when is_non_empty_binary(full_name),
    do: HumanName.Native.middle_initials(full_name)

  def middle_initials(_), do: name_not_provided()

  @doc """
  Returns the combined initials for the first (given) name and last (surname) name.

  ## Example

        iex> HumanName.first_and_last_initials("Jimmy H Jenkins")
        {:ok, "JJ"}

        iex> HumanName.first_and_last_initials("Dr. Alibaster Cornelius Juniper III")
        {:ok, "AJ"}

        iex> HumanName.first_and_last_initials("")
        {:error, "No valid name found"}
  """
  def first_and_last_initials(full_name) when is_non_empty_binary(full_name),
    do: HumanName.Native.first_and_last_initials(full_name)

  def first_and_last_initials(_), do: name_not_provided()

  @doc deprecated: "Use HumanName.first_and_last_initials/1 instead"
  # coveralls-ignore-start
  def initials(full_name), do: first_and_last_initials(full_name)
  # coveralls-ignore-stop

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
  def last_name(full_name) when is_non_empty_binary(full_name),
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
  def normalize(full_name) when is_non_empty_binary(full_name),
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
  def normalize_full(full_name) when is_non_empty_binary(full_name),
    do: HumanName.Native.normalize_full(full_name)

  def normalize_full(_), do: name_not_provided()

  defp name_not_provided(), do: {:error, "No valid name found"}

  defp names_not_provided(), do: {:error, "No valid names found"}
end
