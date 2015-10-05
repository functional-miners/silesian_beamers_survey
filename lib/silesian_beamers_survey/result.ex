defmodule SilesianBeamersSurvey.Response do
  alias __MODULE__

  defstruct [:question, :response]

  def new(question, response, node) when is_binary(question) and is_binary(response) do
    %Response{question: question, response: response}
  end
end

defmodule SilesianBeamersSurvey.Result do
  alias __MODULE__

  defstruct [:date, :meeting, :node, :responses]

  defp format_date_and_time({date, time}) do
    :io_lib.format("~4..0B-~2..0B-~2..0BT~2..0B:~2..0B:~2..0BZ", Tuple.to_list(date) ++ Tuple.to_list(time))
    |> List.flatten
    |> to_string
  end

  def new(meeting, node, responses) do
    %Result{date: format_date_and_time(:erlang.universaltime), meeting: meeting, node: node, responses: responses}
  end
end
