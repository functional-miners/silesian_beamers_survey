defmodule SilesianBeamersSurvey.QuestionServer do
  def become_leader do
    start_link
  end

  def leader_pid do
    case :global.whereis_name(:question_server) do
      :undefined -> nil
      value      -> value
    end
  end

  def start_link do
    # Agent.start_link(fn -> load_questions end, name: __MODULE__)
    Agent.start_link(__MODULE__, :load_questions, [],
                     name: {:global, :question_server})
  end

  def reload_questions do
    # Agent.update(__MODULE__, fn _ -> reload_questions end)
    Agent.update({:global, :question_server}, __MODULE__, :reload_questions, [])
  end

  def get_questions(meeting) do
    # Agent.get(__MODULE__, fn questions -> Map.get(questions, meeting) end)
    Agent.get({:global, :question_server}, Map, :get, [meeting])
  end

  def reload_questions(_old_questions), do: load_questions

  def load_questions do
    priv = Application.app_dir(:silesian_beamers_survey, "priv")

    [priv, "questions", "*"]
    |> Path.join
    |> Path.wildcard
    |> Enum.map(&load_questions/1)
    |> Enum.into(%{})
  end

  defp load_questions(meeting_file) do
    questions =
      meeting_file
      |> File.read!
      |> String.split("\n", trim: true)

    meeting = Path.basename(meeting_file, ".txt")
    {meeting, questions}
  end
end
