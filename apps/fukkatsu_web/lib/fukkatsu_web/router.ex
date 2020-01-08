defmodule FukkatsuWeb.Router do
  use FukkatsuWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/images", FukkatsuWeb do
    pipe_through :api

    get "/random", ImageController, :random, as: "random"

    resources "/anime", AnimeController, except: [:new, :show, :edit]
    resources "/tags", TagController, except: [:new, :show, :edit]
    resources "/moods", MoodController, except: [:new, :show, :edit]
    resources "/cycles", CycleController, except: [:new, :show, :edit]

    resources "/", ImageController, only: [:show, :create, :delete, :update]
  end
end
