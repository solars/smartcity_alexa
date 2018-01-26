defmodule AlexaFurt.Skill do
	use Alexa.Skill, app_id: "dornbirn_furt"      

	def handle_intent("SayHello", request, response) do
		response
		|> say("Hello World!")
    |> Alexa.Response.should_end_session(true)
	end

	def handle_intent("Pegel", request, response) do
		response
		|> say(ServerGen.get(:pegel))
    |> Alexa.Response.should_end_session(true)
	end
end
