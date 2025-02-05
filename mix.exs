defmodule HTTPoison.Mixfile do
  use Mix.Project

  @description """
    Yet Another HTTP client for Elixir powered by hackney
  """

  def project do
    [
      app: :httpoison,
      version: "1.5.1",
      elixir: "~> 1.5",
      name: "HTTPoison",
      description: @description,
      package: package(),
      deps: deps(),
      source_url: "https://github.com/edgurgel/httpoison",
      docs: [
        main: "readme",
        logo: "logo.png",
        extras: [
          "README.md",
          "CHANGELOG.md"
        ]
      ],
      dialyzer: [
        plt_add_deps: :transitive,
        flags: [
          # "-Wunmatched_returns",
          # "-Wrace_conditions",
          # "-Wunderspecs",
          # "-Wunknown",
          # "-Woverspecs",
          # "-Wspecdiffs",
        ]
      ]
    ]
  end

  def application do
    [applications: [:hackney]]
  end

  defp deps do
    [
      {:hackney, git: "https://github.com/benoitc/hackney.git", branch: "master"},
      {:mimic, "~> 0.1", only: :test},
      {:exjsx, "~> 3.1", only: :test},
      {:httparrot, "~> 1.2", only: :test},
      {:earmark, "~> 1.0", only: :dev},
      {:ex_doc, "~> 0.18", only: :dev},
      {:dialyxir, "~> 1.0.0-rc.3", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Eduardo Gurgel Pinho"],
      licenses: ["MIT"],
      links: %{
        Changelog: "https://github.com/edgurgel/httpoison/blob/master/CHANGELOG.md",
        GitHub: "https://github.com/edgurgel/httpoison"
      }
    ]
  end
end
