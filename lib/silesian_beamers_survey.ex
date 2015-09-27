defmodule SilesianBeamersSurvey do
  alias SilesianBeamersSurvey.Response
  alias SilesianBeamersSurvey.Result

  use Application

  @doc false
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(SilesianBeamersSurvey.NodeMonitor, [])
    ]

    opts = [strategy: :one_for_one, name: SilesianBeamersSurvey.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def run(meeting) do
    responses =
      meeting
      |> SilesianBeamersSurvey.QuestionServer.get_questions
      |> Enum.map(&ask_question/1)

    Result.new(meeting, responses)
    |> SilesianBeamersSurvey.Aggregator.push
  end

  defp ask_question(question) do
    IO.puts(question)
    response = IO.gets("> ")

    Response.new(question, response)
  end
end
