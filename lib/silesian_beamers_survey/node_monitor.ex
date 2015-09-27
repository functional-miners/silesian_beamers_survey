defmodule SilesianBeamersSurvey.NodeMonitor do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def get_all do
    GenServer.call(__MODULE__, :get_all)
  end

  ## Callbacks

  def init(:ok) do
    :ok = :global_group.monitor_nodes(true)
    nodes = HashSet.new
    {:ok, nodes}
  end

  def handle_call(:get_all, _from, nodes) do
    {:reply, HashSet.to_list(nodes), nodes}
  end

  def handle_info({:nodeup, node}, nodes) do
    IO.puts "\nNodeMonitor: #{node} joined"
    {:noreply, HashSet.put(nodes, node)}
  end

  def handle_info({:nodedown, node}, nodes) do
    IO.puts "\nNodeMonitor: #{node} left"
    {:noreply, HashSet.delete(nodes, node)}
  end
end
