defmodule SilesianBeamersSurvey.Mixfile do
  use Mix.Project

  def project do
    [app: :silesian_beamers_survey,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [mod: {SilesianBeamersSurvey, []},
     applications: [:logger]]
  end

  defp deps do
    [
      {:poison, "~> 1.5.0"}
    ]
  end
end
