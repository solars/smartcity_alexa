defmodule ServerGen do
  use GenServer
  @name __MODULE__

	#Client API
 
  def start_link do
    GenServer.start_link(@name, %{}, name: @name)
  end
 
  def get(key) do
    GenServer.call(@name, {:get, key})
  end
 
  def update(map) do
    GenServer.cast(@name, {:update, map})
  end
 
  # Server Callbacks
 
  def handle_call({:get, key}, _from, map) do
    {:reply, map[key], map}
  end
 
  def handle_cast({:update, newmap}, map) do
    result = Map.merge(map, newmap)
    {:noreply, result}
  end
end
