defmodule EctoCSV do
  @moduledoc """
  `EctoCSV` provides an interface to work with `Ecto` while storing the data in CSVs.

  This document will present an overview of `EctoCSV` and will talk about
  when is the right time to use this adapter over other available adapters like `Postgres`
  and `Mnesia`.

  If you are new to `Ecto` check out the [Ecto documentation](http://hexdocs.pm/ecto)
  for an overview of `Ecto`.

  ## Storage Options
    * `dir` - Path of the directory where CSVs will be stored.
    * `backup` - Path where the database should be backed-up. If this option is not
                  given, the database isn't backed up.

  ## Format Options
    * `eol` - Character used to determine the end of a line in the `csv`. Defaults to `"\n"`
    * `eoc` - Character used to determine the end of a column in the `csv`. Defaults to `","`

  ## Advantages
    * Readabillity - <elaborate>
    * Portability - <elaborate>
    * Reusability - <elaborate>
    * Ease of Installation - <elaborate>

  ## Limitations
    * Speed ineffeciency - <elaborate>
    * Space ineffeciency - <elaborate>

  ## Supported Features
  Following are the supported features in `EctoCSV`:

  ### Types
  <elaborate>

  ### Associations
  <elaborate>

  ### Query
  <elaborate>

  ### Transactions
  <elaborate>

  ### UUIDs
  <elaborate>


  ## Compatibillity
  `EctoCSV` guarantees compatibility with the following tools:

  ### Elixir Versions:
    * 1.4.2

  ### Ecto Versions:
    * 2.1.X

  `EctoCSV` will likely be compatible (for the most part) with other versions too,
  but it is specifically designed for the versions listed above.

  """
  @behaviour Ecto.Adapter
  @behaviour Ecto.Adapter.Storage
  @behaviour Ecto.Adapter.Migration

  @doc false
  defmacro __before_compile__(env), do: :ok

  @doc """
  Automatically generates next ID for binary keys.
  Leaves sequence keys `nil` for generation on insert.

  ## Examples:

      iex> EctoCSV.autogenerate(:id)
      nil

      iex> EctoCSV.autogenerate(:embed_id) != nil
      true

      iex> EctoCSV.autogenerate(:binary_id) != nil
      true
  """
  def autogenerate(:id),        do: nil
  def autogenerate(:embed_id),  do: Ecto.UUID.generate()
  def autogenerate(:binary_id), do: Ecto.UUID.bingenerate()

  @doc """
  Returns the childspec that starts the adapter process.
  This method is called from `Ecto.Repo.Supervisor.init/2`.
  """
  def childspec(_repo, _opts) do
    Supervisor |> Supervisor.Spec.supervisor([[], [strategy: :one_for_one]])
  end

  @doc """
  Deletes a single record from the CSV with the given filters and options.
  """
  def delete(repo, schema_meta, filters, options) do
    #
  end

  @doc """
  Returns the loaders for a given type.
  It receives the primitive type and the Ecto type (which may be primitive as well).
  It returns a list of loaders with the given type usually at the end.
  """
  def loaders(:boolean, type), do: [&bool_decode/1, type]
  def loaders(:binary_id, type), do: [Ecto.UUID, type]
  def loaders(_primitive, type), do: [type]

  defp bool_decode("false"), do: {:ok, false}
  defp bool_decode("true"), do: {:ok, true}
end
