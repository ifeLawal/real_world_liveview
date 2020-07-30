defmodule DemoAppWeb.Router do
  use DemoAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {DemoAppWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DemoAppWeb do
    pipe_through :browser

    live "/", PageLive, :index

    live "/counter", CounterLive, :index

    live "/list", ListLive, :index
    live "/list2", ListTempLive, :index


  end

  # Other scopes may use custom stacks.
  # scope "/api", DemoAppWeb do
  #   pipe_through :api
  # end
end
