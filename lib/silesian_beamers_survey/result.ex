defmodule SilesianBeamersSurvey.Response do
  alias __MODULE__

  defstruct [:question, :response]

  def new(question, response) when is_binary(question) and is_binary(response) do
    %Response{question: question, response: response}
  end
end

defmodule SilesianBeamersSurvey.Result do
  alias __MODULE__

  defstruct [:date, :responses, :meeting]

  def new(meeting, responses) do
    %Result{date: :erlang.universaltime, meeting: meeting, responses: responses}
  end
end
