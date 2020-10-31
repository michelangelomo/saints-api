defmodule Saints.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/today" do
    send_resp(conn, 200, Jason.encode!(Saints.today()))
  end

  get "/random" do
    send_resp(conn, 200, Jason.encode!(Saints.random()))
  end

  match _ do
    send_resp(conn, 404, "404 Not Found")
  end
end
