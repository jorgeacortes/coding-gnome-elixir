defmodule AppHtmlWeb.Router do
  use AppHtmlWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {AppHtmlWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/hangman", AppHtmlWeb do
    pipe_through :browser

    get "/", HangmanController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppHtmlWeb do
  #   pipe_through :api
  # end
end
