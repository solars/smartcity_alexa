defmodule AlexaFurt do
	use Application
  require Logger

  def start(_type, _args) do
		import Supervisor.Spec

    port = Application.fetch_env!(:my_app, :port)

    children = [
			Plug.Adapters.Cowboy.child_spec(:http, AlexaFurt.Router, [], port: 80),
			worker(AlexaFurt.Skill, [[app_id: "dornbirn_furt"]]),
			worker(Server, []),
			worker(ServerGen, [])
    ]

    Logger.info("Started application")

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
