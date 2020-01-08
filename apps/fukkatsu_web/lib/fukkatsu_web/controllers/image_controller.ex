defmodule FukkatsuWeb.ImageController do
  use FukkatsuWeb, :controller

  alias Fukkatsu.Images
  alias Fukkatsu.Images.Image

  action_fallback FukkatsuWeb.FallbackController

  def index(conn, _params) do
    images = Images.list_images()
    render(conn, "index.json", images: images)
  end

  def create(conn, %{"image" => %Plug.Upload{filename: filename, path: _path}}) do
    # TODO: path

    with {:ok, %Image{} = image} <- Images.create_image(%{file_name: filename}) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.image_path(conn, :show, image))
      |> render("show.json", image: image)
    end
  end

  def create(_conn, _) do
    raise FukkatsuWeb.Errors.MissingParametersError, ["image"]
  end

  def show(conn, %{"id" => id}) do
    image = Images.get_image!(id)

    render(conn, "show.json", image: image)
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Images.get_image!(id)

    with {:ok, %Image{} = image} <- Images.update_image(image, image_params) do
      render(conn, "show.json", image: image)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Images.get_image!(id)

    with {:ok, %Image{}} <- Images.delete_image(image) do
      send_resp(conn, :no_content, "")
    end
  end
end
