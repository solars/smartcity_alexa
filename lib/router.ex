defmodule AlexaFurt.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  post "/command" do
    {:ok, body, conn} = read_body(conn)
    request = Poison.decode!(body, as: %Alexa.Request{})
    response = Alexa.handle_request(request)
    conn = send_resp(conn, 200, Poison.encode!(response))
    conn = %{conn | resp_headers: [{"content-type", "application/json"}]}
    conn
  end

  post "/update" do
    {:ok, body, conn} = read_body(conn)
    IO.inspect body
    %{"pegel" => pegel} = Poison.decode!(body)
		ServerGen.update(%{pegel: pegel})
    conn = send_resp(conn, 200, "ok")
    conn = %{conn | resp_headers: [{"content-type", "application/json"}]}
    conn
  end

  get("/", do: send_resp(conn, 200, "Welcome"))
  match(_, do: send_resp(conn, 404, "Oops!"))
end
