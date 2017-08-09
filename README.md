# Ecto.CSV

`EctoCSV` provides an interface to work with `Ecto` while storing the data in CSVs.

This document will present an overview of `EctoCSV` and will talk about
when is the right time to use this adapter over other available adapters like `Postgres`
and `Mnesia`.

If you are new to `Ecto` check out the [Ecto documentation](http://hexdocs.pm/ecto)
for an overview of `Ecto`.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ecto_csv` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ecto_csv, "~> 0.1.0"}]
end
```

## Storage Options
  * `dir` - Path of the directory where CSVs will be stored.
  * `backup` - Path where the database should be backed-up. If this option is not
                given, the database isn't backed up.

## Format Options
  * `eol` - Character used to determine the end of line in the `csv`. Defaults to `"\n"`

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


## Contributing


## Credits


