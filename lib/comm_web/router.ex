defmodule CommWeb.Router do
  use CommWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: CommWeb.Schema,
      interface: :simple,
      context: %{pubsub: CommWeb.Endpoint}
  end


end
