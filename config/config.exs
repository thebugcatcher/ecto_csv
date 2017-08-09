use Mix.Config

if Mix.env == :test ||
    Mix.env == :dev ||
    Mix.env == :docs, do: import_config "#{Mix.env}.exs"

