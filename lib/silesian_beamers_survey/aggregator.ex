defmodule SilesianBeamersSurvey.Aggregator do
  use GenServer

  alias SilesianBeamersSurvey.Result

  def become_leader do
    start_link
  end

  def leader_pid do
    case :global.whereis_name(:aggregator) do
      :undefined -> nil
      value      -> value
    end
  end

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: {:global, :aggregator})
  end

  def push(%Result{} = result) do
    GenServer.cast({:global, :aggregator}, {:push, result})
  end

  def dump() do
    GenServer.call({:global, :aggregator}, :dump)
  end

  ## Callbacks

  def init(:ok) do
    {:ok, []}
  end

  def handle_call(:dump, _from, results) do
    :ok = File.write "./priv/dump.json", Poison.encode!(results)
    {:reply, :dumped, results}
  end

  def handle_cast({:push, result}, results) do
    log_result(result)
    {:noreply, [result | results]}
  end

  defp log_result(result) do
    IO.puts "\nNew survey result:\n#{inspect result}"
  end
end
