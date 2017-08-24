defmodule Identicon.Mixfile do
  use Mix.Project

  def project do
    [
      app: :identicon,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:egd, github: "erlang/egd"},
      {:earmark, "~> 1.2",  only: :dev},
      {:ex_doc,  "~> 0.16", only: :dev},
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:exmagick, "~> 0.0.5"},
      {:ex_image_info, "~> 0.2.0"}
    ]
  end

end
