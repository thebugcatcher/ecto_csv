defmodule EctoCSV.Config do
  @moduledoc """
  `EctoCSV.Config` module holds all the configuration information for
  `EctoCSV` and how to access each configuration detail.

  This module is mostly for internal use, but can be used to access a
  configuration outside of `EctoCSV`'s internal modules.
  """

  @doc """
  `dir` is the path to the directory where CSVs will be stored.
  If this configuration isn't setup, `ecto_csv` uses current path from where
  this is being executed.

  ## Examples
  When no config is set, if returns the current path
  (`"."`):
      iex> alias EctoCSV.Config
      iex> Config.dir
      "."
  """
  def dir do
    config(:dir, ".")
  end

  @doc """
  `backup` is the path to the directory where the CSVs will be backed up.
  If this configuration isn't setup, `ecto_csv` doesn't backup the database.

  ## Examples
  When no config is set, if returns `:no_backup`
  (`:no_backup`):
      iex> alias EctoCSV.Config
      iex> Config.dir
      :no_backup
  """
  def backup do
    config(:backup, :no_backup)
  end

  @doc """
  `eol` (End Of Line) is the character which is used to determine the end of a
  line in the CSVs in the database.
  If this configuration isn't setup, `ecto_csv` uses `"\n"` as `eol`.

  ## Examples
  When no config is set, if returns `"\n"`
  (`"\n"`):
      iex> alias EctoCSV.Config
      iex> Config.dir
      "\n"
  """
  def eol do
    config(:eol, "\n")
  end

  @doc """
  `eoc` (End Of Column) is the character which is used to determine the end of a
  column in the CSVs in the database.
  If this configuration isn't setup, `ecto_csv` uses `","` as `eol`.

  ## Examples
  When no config is set, if returns `","`
  (`","`):
      iex> alias EctoCSV.Config
      iex> Config.dir
      ","
  """
  def eoc do
    config(:eoc, ",")
  end

  @doc """
  `resolve_system_config` returns a `system` variable set up with `var_name` key
   or returns the specified `default` value. Takes in `arg` whose first element is
   an atom `:system`.

  ## Examples
  Returns value corresponding to a system variable config or returns the `default` value:
      iex> alias EctoCSV.Config
      iex> Config.resolve_system_config({:system, "some random config"}, "default")
      "default"
  """
  @spec resolve_system_config(Tuple.t, term) :: {term}
  def resolve_system_config({:system, var_name}, default) do
    System.get_env(var_name) || default
  end

  defp config do
    Application.get_env(:ecto_csv, EctoCSV, [])
  end

  defp config(key, default) do
    config()
    |> Keyword.get(key, default)
    |> resolve_config(default)
  end

  defp resolve_config(value, _default), do: value
end
