defmodule Server do 
  @name __MODULE__

  def start_link() do
    Agent.start_link(fn -> nil end, name: @name)
  end

	def get do 
		Agent.get(@name, fn state -> 
			state
		end)
	end

	def update(value) do
		Agent.update(@name, fn list -> value end)
	end

end
