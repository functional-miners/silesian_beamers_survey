defmodule SilesianBeamersSurvey.Mixfile do
  use Mix.Project

  def project do
    [app: :silesian_beamers_survey,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     escript: escript]
  end

  def application do
    [applications: [:logger, :ssl]]
  end

  def escript do
    [main_module: SilesianBeamersSurvey.CLI]
  end

  defp deps do
    [{:gen_smtp, "~> 0.9.0"}]
  end
end
